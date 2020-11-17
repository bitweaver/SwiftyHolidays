import Foundation

final class Canada: CountryWithStateBase<CanadianProvince> {
    
    override func allHolidays(in year: Int) -> [Holiday] {
        //TODO force unwrap
        let newYearsDay = Holiday.init(name: "New Year's Day", date: LocalDate.init(year: year, month: .january, day: 1)!)
        let heritageDay = getHeritageDay(year: year)
        let goodFriday = getGoodFriday(year: year)
        let easter = Holiday.init(name: "Easter", date: LocalDate.easter(in: year))
        let easterMonday = getEasterMonday(year: year)
        let victoriaDay = getVictoriaDay(year: year)
        let memorialDay = getMemorialDay(year: year)
        let laborDay = getLaborDay(year: year)
        let thanksgiving = getThanksGiving(year: year)
        let remembranceDay = getRemembranceDay(year: year)
        let christmasEve = getChristmasEve(year: year)
        let christmasDay = getChristmasDay(year: year)
        
        return [newYearsDay, heritageDay, goodFriday, easter, easterMonday, victoriaDay, memorialDay, laborDay, thanksgiving, remembranceDay, christmasEve, christmasDay]
    }
    
    //third monday in february
    //heritage day, islander day, louis riel day, family day. depending on the provimce
    func getHeritageDay(year: Int) -> Holiday {
        let date = Month.february.get(.third, .monday, in: year)
        return Holiday.init(name: "Heritage Day", date: date)
    }
    
    //Friday before easter
    func getGoodFriday(year: Int) -> Holiday {
        let easter = LocalDate.easter(in: year)
        let date = easter.previous(.friday)
        return Holiday.init(name: "Good Friday", date: date)
    }
    
    func getEasterMonday(year: Int) -> Holiday {
        let easter = LocalDate.easter(in: year)
        let date = easter.next(.monday)
        return Holiday.init(name: "Easter Monday", date: date)
    }
    
    //monday before may 25th, national patriots day in Quebec
    func getVictoriaDay(year: Int) -> Holiday {
        var ret = Holiday.init(name: "", date: (year, .january, 1))
        guard let may25th = LocalDate.init(year: year, month: 5, day: 25)
        else { return ret }
        let date = may25th.previous(.monday)
        ret = Holiday.init(name: "Victoria Day", date: date)
        return ret
    }
    
    //memorial day and canada day are on same day
    func getMemorialDay(year: Int) -> Holiday {
        var ret = Holiday.init(name: "", date: (year, .january, 1))
        guard let date = LocalDate.init(year: year, month: 7, day: 1)
        else { return ret }
        ret = Holiday.init(name: "Memorial Day", date: date)
        return ret
    }
    
    //first monday in september
    func getLaborDay(year: Int) -> Holiday {
        let date = Month.september.get(.first, .monday, in: year)
        return Holiday.init(name: "Labor Day", date: date)
    }
    
    //Second Monday in October
    func getThanksGiving(year: Int) -> Holiday {
        let date = Month.october.get(.second, .monday, in: year)
        return Holiday.init(name: "Thanksgiving Day", date: date)
    }
    
    func getRemembranceDay(year: Int) -> Holiday {
        var ret = Holiday.init(name: "", date: (year, .january, 1))
        guard let date = LocalDate.init(year: year, month: 11, day: 11)
        else {return ret}
        ret = Holiday.init(name: "Remembrance Day", date: date)
        return ret
    }
    
    func getChristmasEve(year: Int) -> Holiday {
        var ret = Holiday.init(name: "", date: (year, .january, 1))
        guard let date = LocalDate.init(year: year, month: 12, day: 24)
        else { return ret }
        ret = Holiday.init(name: "Christmas Eve", date: date)
        return ret
    }
    
    func getChristmasDay(year: Int) -> Holiday {
        var ret = Holiday.init(name: "", date: (year, .january, 1))
        guard let date = LocalDate.init(year: year, month: 12, day: 25)
        else { return ret }
        ret = Holiday.init(name: "Christmas Day", date: date)
        return ret
    }
}


public enum CanadianProvince: CaseIterable {
    case alberta
    case britishColumbia
    case manitoba
    case newBrunswick
    case newfoundland
    case labrador
    case novaScotia
    case ontario
    case princeEdwardIsland
    case quebec
    case saskatchewan
}
