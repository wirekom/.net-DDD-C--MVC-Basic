﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentNHibernate.Mapping;
using PHD.Session.Classes;

namespace PHD.Session.Mappings
{
    public class CityMap : ClassMap<City>
    {
        public CityMap()
        {

            Id(x => x.Id).Column("id");
            Map(x => x.name).Not.Nullable();
        }
    }
}