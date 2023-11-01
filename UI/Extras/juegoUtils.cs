﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrabajoPractico.Extras
{
    public class EventCellOutter : EventArgs
    {
        public int barcoID;
        public EventCellOutter(int barcoID)
        {
            this.barcoID = barcoID;
        }
    }

    public class EventCellInner : EventArgs
    {
        public int barcoID;
        public int inthxpos;
        public string hxpos;
        public EventCellInner(int barcoID)
        {
            this.barcoID = barcoID;
        }
    }

}
