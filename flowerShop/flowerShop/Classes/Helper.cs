﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace flowerShop.Classes
{
    public static class Helper
    {
        //доступное свойство связи с БД
        public static Model.DBFlowerEntities DB { get; set; }

        //Доступное свойство пользователя системы
        public static Model.User User { get; set; }
    }
}
