let { tap, hold, macro, .. } = import "fak/keycode.ncl" in
let util = import "fak/util_functions.ncl" in

let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let mt = tap.reg.mod in
let ms = tap.sticky.mod in
let MO = hold.reg.layer in
let TO = tap.layer.TO in
let me = tap.custom.media in
let fk = tap.custom.fak in

let XXXXXXXX = tap.none & hold.none in
let TTTTTTTT = tap.trans & hold.trans in

let _BASE   = 0 in
let _GAME   = 1 in
let _GNUM   = 2 in
let _LOWR   = 3 in
let _RISE   = 4 in
let _FUNC   = 5 in
let _AJST   = 6 in 

let macro_kvm = fun keycode =>
  let steps = [
    macro.tap mt.rctl,
    macro.tap mt.rctl,
    macro.tap keycode,
  ] in
  macro.make steps
in

let macro_qa = fun keycode =>
  let steps = [
    macro.tap keycode,
    macro.tap (TO _BASE),
  ] in
  macro.make steps
in

let qp = fun keycode =>
  let steps = [
    macro.tap keycode,
  ] in
  macro.make steps
in

let cu = {
  D_MUT = mt.lsft & mt.lctl & kc.F9,
  D_SIL = mt.lsft & mt.lctl & kc.F11,
  D_SHS = mt.lsft & mt.lctl & kc.F10,
  VD_L = mt.lgui & mt.lctl & kc.LEFT,
  VD_R = mt.lgui & mt.lctl & kc.RIGHT,
  VD_U = mt.lgui & kc.TAB,
  E_IEX = mt.ralt & kc.N1,
  E_IQM = mt.ralt & kc.SLSH,
  E_NN  = mt.ralt & kc.N,
  E_CC  = mt.ralt & kc.C,
  E_LL  = mt.ralt & mt.lsft & kc.SCLN,
  E_OF  = mt.ralt & kc.N2,
  E_OM  = mt.ralt & kc.N3,
  E_EUR = mt.ralt & kc.N5,
  E_PND = mt.ralt & kc.N4,
  E_DEG = mt.ralt & kc.SCLN,
  E_AOB = macro_qa (mt.ralt & kc.GRV),
  E_ATC = macro_qa (mt.ralt & kc.QUOT),
  E_ACF = macro_qa (mt.ralt & kc.N6),
  E_ADI = macro_qa (mt.ralt & mt.lsft & ks.DQUO),
  E_ATI = macro_qa (mt.ralt & mt.lsft & kc.GRV),
  E_SMT = macro_qa (mt.ralt & mt.lsft & kc.M),
  E_SLI = macro_qa (mt.ralt & kc.BSLS),
  KVM1 = macro_kvm kc.N1,
  KVM2 = macro_kvm kc.N2,
  AF4 = mt.lalt & kc.F4
} in

let keymap = {
  conditional_layers = {
    "6" = [_RISE, _LOWR]
  },
  layers = [
    # BASE
    [
      kc.TAB,   kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,           kc.Y,     kc.U,     kc.I,     kc.O,     kc.P,     kc.ENT,     
      md.lsft,  kc.A,     kc.S,     kc.D,     kc.F,     kc.G,           kc.H,     kc.J,     kc.K,     kc.L,     kc.SCLN,  kc.QUOT,     
      md.lctl,  kc.Z,     kc.X,     kc.C,     kc.V,     kc.B,           kc.N,     kc.M,     kc.COMM,  kc.DOT,   kc.SLSH,  md.lalt,     
                          md.ralt,  md.lgui,  kc.SPC,   MO _RISE,       MO _LOWR, kc.BSPC,  md.rsft,  kc.DEL,                     
    ],
    # GAME    
    [
      kc.TAB,   kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,           kc.Y,     kc.U,     kc.I,     kc.O,     kc.P,     kc.ENT,     
      md.lsft,  kc.A,     kc.S,     kc.D,     kc.F,     kc.G,           kc.H,     kc.J,     kc.K,     kc.L,     kc.SCLN,  kc.QUOT,     
      md.lctl,  kc.Z,     kc.X,     kc.C,     kc.V,     kc.B,           kc.N,     kc.M,     kc.COMM,  kc.DOT,   kc.SLSH,  md.lgui,     
                          XXXXXXXX, md.lalt,  kc.SPC,   MO _GNUM,       MO _LOWR, kc.BSPC,  md.rsft,  kc.DEL,                     
    ],
    # GNUM
    [
      kc.ESC,   kc.N1,    TTTTTTTT, kc.N2,    kc.N3,    kc.N4,          cu.VD_U,  TTTTTTTT, kc.UP,    TTTTTTTT, cu.VD_R,  cu.AF4, 
      TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT,       cu.VD_L,  kc.LEFT,  kc.DOWN,  kc.RIGHT, TTTTTTTT, TTTTTTTT, 
      TTTTTTTT, MO _FUNC, kc.N5,    kc.N6,    TTTTTTTT, TTTTTTTT,       TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, 
                          TTTTTTTT, TTTTTTTT, TTTTTTTT, MO _GNUM,       TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT,                     
    ],
    # LOWR
    [
      TTTTTTTT, ks.EXLM,  ks.AT,    ks.HASH,  ks.DLR,   ks.PERC,        cu.E_AOB, kc.N7,    kc.N8,    kc.N9,    cu.E_ATC, TTTTTTTT,   
      TTTTTTTT,ks.TILD,qp kc.MINS,qp ks.PLUS,qp kc.EQL, cu.E_PND,       cu.E_ADI, kc.N4,    kc.N5,    kc.N6,    kc.N0,    TTTTTTTT,    
      TTTTTTTT, kc.GRV,qp kc.SLSH,qp ks.ASTR,qp ks.UNDS,cu.E_EUR,    qp cu.E_NN,  kc.N1,    kc.N2,    kc.N3,    MO _FUNC, TTTTTTTT,   
                          TTTTTTTT, TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT, TTTTTTTT,                     
    ],
    # RISE
    [
      TTTTTTTT, cu.VD_L,  kc.HOME,  kc.UP,    kc.END,   cu.VD_U,        ks.CIRC,  ks.AMPR,  ks.ASTR,  ks.LPRN,  ks.RPRN,  TTTTTTTT,   
      TTTTTTTT, kc.ESC,   kc.LEFT,  kc.DOWN,  kc.RIGHT, cu.VD_R,    qp ks.LCBR,qp kc.LBRC,qp kc.RBRC,qp ks.RCBR,ks.COLN,  ks.DQUO,    
      TTTTTTTT, MO _FUNC, kc.PGDN,qp cu.E_CC, kc.PGUP,  kc.DEL,     qp kc.BSLS,qp ks.PIPE,  ks.LABK,  ks.RABK,  ks.QUES,  TTTTTTTT,   
                          TTTTTTTT, TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT, TTTTTTTT,                     
    ],
    # FUNC
    [
      TTTTTTTT, fk.BOOT,  kc.F7,    kc.F8,    kc.F9,    kc.F12,         kc.F12,   kc.F7,    kc.F8,    kc.F9,    fk.BOOT,  TTTTTTTT, 
      TTTTTTTT, fk.RESET, kc.F4,    kc.F5,    kc.F6,    kc.F11,         kc.F11,   kc.F4,    kc.F5,    kc.F6,    fk.RESET, TTTTTTTT, 
      TTTTTTTT, XXXXXXXX, kc.F1,    kc.F2,    kc.F3,    kc.F10,         kc.F10,   kc.F1,    kc.F2,    kc.F3,    XXXXXXXX, TTTTTTTT, 
                          TTTTTTTT, TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT, TTTTTTTT,                     
    ],
    # AJST
    [
      TTTTTTTT, cu.E_IEX, cu.E_ACF, cu.E_LL,  cu.D_SHS, me.VOLU,        me.PREV,  kc.INS,   kc.PSCR,  kc.SCRL,  kc.PAUS,  TTTTTTTT, 
      TTTTTTTT, kc.CAPS,  cu.E_OM,  cu.E_OF,  cu.D_MUT, me.VOLD,        me.PLAY,  TO _BASE, TO _GAME, ms.ralt,  kc.APP,   md.rsft, 
      md.ralt,  kc.NUBS,  cu.E_ATI, cu.E_DEG, cu.D_SIL, me.MUTE,        me.NEXT,  cu.KVM1,  cu.KVM2,  XXXXXXXX, cu.E_IQM, md.rctl, 
                          md.lalt,  md.lsft,  TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, md.rgui,  TTTTTTTT,                     
    ],
  ]
} in

keymap
