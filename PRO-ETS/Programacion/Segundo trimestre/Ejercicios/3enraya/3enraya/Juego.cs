using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace _3enraya
{
    class Juego
    {
        public struct partida
        {
            public string btn1;
            public string btn2;
            public string btn3;
            public string btn4;
            public string btn5;
            public string btn6;
            public string btn7;
            public string btn8;
            public string btn9;
        }

        public static partida p = new partida();


        public Juego()
        {
            p.btn1 = null;
            p.btn2 = null;
            p.btn3 = null;
            p.btn4 = null;
            p.btn5 = null;
            p.btn6 = null;
            p.btn7 = null;
            p.btn8 = null;
            p.btn9 = null;

        }
        /// <summary>
        /// Metodo asigna el turno
        /// </summary>
        /// <param name="btn"></param>
        /// <param name="btnChar"></param>
        public static void turno(int btn, string btnChar)
        {
            switch (btn)
            {
                case 1:
                    p.btn1 = btnChar;
                    break;
                case 2:
                    p.btn2 = btnChar;
                    break;
                case 3:
                    p.btn3 = btnChar;
                    break;
                case 4:
                    p.btn4 = btnChar;
                    break;
                case 5:
                    p.btn5 = btnChar;
                    break;
                case 6:
                    p.btn6 = btnChar;
                    break;
                case 7:
                    p.btn7 = btnChar;
                    break;
                case 8:
                    p.btn8 = btnChar;
                    break;
                case 9:
                    p.btn9 = btnChar;
                    break;
            }

        }
        /// <summary>
        /// Resetea los botones a nulo
        /// </summary>
        public static void ResetAll()
        {
            p.btn1 = null;
            p.btn2 = null;
            p.btn3 = null;
            p.btn4 = null;
            p.btn5 = null;
            p.btn6 = null;
            p.btn7 = null;
            p.btn8 = null;
            p.btn9 = null;

        }
        /// <summary>
        /// Metodo que devuelve un entero aleatorio entre 0 y 1
        /// </summary>
        /// <returns>Entero aleatorio</returns>
        public static int quienJuega()
        {
            int res = 0;

            Random r = new Random();
            res = r.Next(0, 2);

            return res;
        }

        /// <summary>
        /// Comprueba si hay 3 en raya
        /// </summary>
        /// <returns></returns>
        public static bool Comprobar()
        {
            bool res = false;

            ///Vertical | Horizontal | diagonal
            if (p.btn1 != null && p.btn2 == p.btn1 && p.btn3 == p.btn1 && p.btn2 != null && p.btn3 != null || p.btn4 == p.btn1 && p.btn7 == p.btn1 && p.btn4 != null && p.btn7 != null || p.btn5 == p.btn1 && p.btn9 == p.btn1 && p.btn5 != null && p.btn9 != null || p.btn3 == p.btn5 && p.btn7 == p.btn5 && p.btn3 != null && p.btn7 != null)
            {
                res = true;
            }
            //Centro a los lados
            if (p.btn5 != null && p.btn2 == p.btn5 && p.btn8 == p.btn5 && p.btn2 != null && p.btn8 != null || p.btn4 == p.btn5 && p.btn6 == p.btn5 && p.btn4 != null && p.btn6 != null)
            {
                res = true;
            }
            return res;
        }

        public static int TurnoMaquina(int turno, bool JStarted)
        {
            int res = 0;
            if (turno == 1)
            {
                res = 5;
                p.btn5 = "O";

            }
            if (turno == 3 && JStarted == false)
            {
                Random r = new Random();
                res = r.Next(1, 10);
                switch (res)
                {
                    case 1:
                        p.btn1 = "O";
                        return 1;
                    case 2:
                        p.btn2 = "O";
                        return 2;
                    case 3:
                        p.btn3 = "O";
                        return 3;
                    case 4:
                        p.btn4 = "O";
                        return 4;
                    case 5:
                        p.btn5 = "O";
                        return 5;
                    case 6:
                        p.btn6 = "O";
                        return 6;
                    case 7:
                        p.btn7 = "O";
                        return 7;
                    case 8:
                        p.btn8 = "O";
                        return 8;
                    case 9:
                        p.btn9 = "O";
                        return 9;
                }

            }
            if (turno % 2 != 0 && turno > 3 || JStarted == true && turno != 1)
            {
                ///1-5>9
                if (p.btn1 == p.btn5 && p.btn1 != null && p.btn5 != null && p.btn9 != "X" && p.btn9 != "O")
                {
                    p.btn9 = "O";
                    return 9;
                }
                ///9-5>1
                if (p.btn9 == p.btn5 && p.btn9 != null && p.btn5 != null && p.btn1 != "X" && p.btn1 != "O")
                {
                    p.btn1 = "O";
                    return 1;
                }
                ///3-5>7
                if (p.btn3 == p.btn5 && p.btn3 != null && p.btn5 != null && p.btn7 != "X" && p.btn7 != "O")
                {
                    p.btn7 = "O";
                    return 7;
                }
                ///7-5>3
                if (p.btn7 == p.btn5 && p.btn7 != null && p.btn5 != null && p.btn3 != "X" && p.btn3 != "O")
                {
                    p.btn3 = "O";
                    return 3;
                }
                ///1-2>3
                if (p.btn1 == p.btn2 && p.btn1 != null && p.btn2 != null && p.btn3 != "X" && p.btn3 != "O")
                {
                    p.btn3 = "O";
                    return 3;
                }
                ///3-2>1
                if (p.btn3 == p.btn2 && p.btn3 != null && p.btn2 != null && p.btn1 != "X" && p.btn1 != "O")
                {
                    p.btn1 = "O";
                    return 1;
                }
                ///7-8>9
                if (p.btn7 == p.btn8 && p.btn7 != null && p.btn8 != null && p.btn9 != "X" && p.btn9 != "O")
                {
                    p.btn9 = "O";
                    return 9;
                }
                ///9-8>7
                if (p.btn9 == p.btn8 && p.btn9 != null && p.btn8 != null && p.btn7 != "X" && p.btn7 != "O")
                {
                    p.btn7 = "O";
                    return 7;
                }

                ///4-5>6
                if (p.btn4 == p.btn5 && p.btn4 != null && p.btn5 != null && p.btn6 != "X" && p.btn6 != "O")
                {
                    p.btn6 = "O";
                    return 6;
                }
                ///6-5>4
                if (p.btn6 == p.btn5 && p.btn6 != null && p.btn5 != null && p.btn4 != "X" && p.btn4 != "O")
                {
                    p.btn4 = "O";
                    return 4;
                }
                ///1-4>7
                if (p.btn1 == p.btn4 && p.btn1 != null && p.btn4 != null && p.btn7 != "X" && p.btn7 != "O")
                {
                    p.btn7 = "O";
                    return 7;
                }
                ///7-4>1
                if (p.btn7 == p.btn4 && p.btn7 != null && p.btn4 != null && p.btn1 != "X" && p.btn1 != "O")
                {
                    p.btn1 = "O";
                    return 1;
                }
                ///3-6>9
                if (p.btn3 == p.btn6 && p.btn3 != null && p.btn6 != null && p.btn9 != "X" && p.btn9 != "O")
                {
                    p.btn9 = "O";
                    return 9;
                }
                ///9-6>3
                if (p.btn9 == p.btn6 && p.btn9 != null && p.btn6 != null && p.btn3 != "X" && p.btn3 != "O")
                {
                    p.btn3 = "O";
                    return 3;
                }
                ///2-5>8
                if (p.btn2 == p.btn5 && p.btn2 != null && p.btn5 != null && p.btn8 != "X" && p.btn8 != "O")
                {
                    p.btn8 = "O";
                    return 8;
                }
                ///8-5>2
                if (p.btn8 == p.btn5 && p.btn8 != null && p.btn5 != null && p.btn2 != "X" && p.btn2 != "O")
                {
                    p.btn2 = "O";
                    return 2;
                }
                /// 1-3>2
                if (p.btn1 == p.btn3 && p.btn1 != null && p.btn3 != null && p.btn2 != "X" && p.btn2 != "O")
                {
                    p.btn2 = "O";
                    return 2;
                }
                ///1-7>4
                if (p.btn1 == p.btn7 && p.btn1 != null && p.btn7 != null && p.btn4 != "X" && p.btn4 != "O")
                {
                    p.btn4 = "O";
                    return 4;
                }
                ///7-9>8
                if (p.btn7 == p.btn9 && p.btn7 != null && p.btn9 != null && p.btn8 != "X" && p.btn8 != "O")
                {
                    p.btn8 = "O";
                    return 8;
                }
                ///3-9>6
                if (p.btn3 == p.btn9 && p.btn3 != null && p.btn9 != null && p.btn6 != "X" && p.btn6 != "O")
                {
                    p.btn6 = "O";
                    return 6;
                }
                ///4-6>5
                if (p.btn4 == p.btn6 && p.btn4 != null && p.btn6 != null && p.btn5 != "X" && p.btn5 != "O")
                {
                    p.btn5 = "O";
                    return 5;
                }
                ///2-8>5
                if (p.btn2 == p.btn8 && p.btn2 != null && p.btn8 != null && p.btn5 != "X" && p.btn5 != "O")
                {
                    p.btn5 = "O";
                    return 5;
                }
                else
                {
                    Random r = new Random();
                    res = r.Next(1, 10);
                    switch (res)
                    {
                        case 1:
                            p.btn1 = "O";
                            return 1;
                        case 2:
                            p.btn2 = "O";
                            return 2;
                        case 3:
                            p.btn3 = "O";
                            return 3;
                        case 4:
                            p.btn4 = "O";
                            return 4;
                        case 5:
                            p.btn5 = "O";
                            return 5;
                        case 6:
                            p.btn6 = "O";
                            return 6;
                        case 7:
                            p.btn7 = "O";
                            return 7;
                        case 8:
                            p.btn8 = "O";
                            return 8;
                        case 9:
                            p.btn9 = "O";
                            return 9;
                    }
                }

            }
            return res;
        }
    }
}


