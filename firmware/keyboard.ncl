let { DirectPinKey, MatrixKey, PeripheralSideKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

let side_central = {
  mcu = CH552T,
  matrix = {
    cols = [32, 14, 15, 16, 17, 10],
    rows = [12, 13, 35, 34]
  },
  split.channel = CH552T.features.uart_30_31,
} in

let side_periph = {
  mcu = CH552T,
  matrix = {
    cols = [32, 14, 15, 16, 17, 10],
    rows = [12, 13, 35, 34]
  },
  split.channel = CH552T.features.uart_30_31,
  keys = 
    let M = MatrixKey in
    [
      M 5 0, M 4 0, M 3 0, M 2 0, M 1 0, M 0 0,
      M 5 1, M 4 1, M 3 1, M 2 1, M 1 1, M 0 1,
      M 5 2, M 4 2, M 3 2, M 2 2, M 1 2, M 0 2,
      M 5 3, M 4 3, M 3 3, M 2 3,
    ]
} in

side_central & {
  usb_dev = {
    vendor_id = 5824,
    product_id = 10203,
    product_ver = 1,
  },
  split.peripheral = side_periph,
  keys =
    let D = DirectPinKey in
    let M = MatrixKey in
    let S = PeripheralSideKey in
    [
      M 0 0, M 1 0, M 2 0, M 3 0, M 4 0, M 5 0,     S 0  , S 1  , S 2  , S 3  , S 4  , S 5  ,
      M 0 1, M 1 1, M 2 1, M 3 1, M 4 1, M 5 1,     S 6  , S 7  , S 8  , S 9  , S 10 , S 11 ,
      M 0 2, M 1 2, M 2 2, M 3 2, M 4 2, M 5 2,     S 12 , S 13 , S 14 , S 15 , S 16 , S 17 ,
                    M 2 3, M 3 3, M 4 3, M 5 3,     S 18 , S 19 , S 20 , S 21 ,
    ]
}
