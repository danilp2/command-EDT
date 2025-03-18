
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//+++++
	//Петухов Д.: добавление на форму полей Контактное лицо и Согласованная скидка
	
	ПолеКонтактноеЛицо = Элементы.Вставить("ДП_КонтактноеЛицо", Тип("ПолеФормы"),Элементы.ГруппаШапкаПраво,Элементы.Договор);
	ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
	ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ДП_КонтактноеЛицо";
	
	ГруппаСогласованнаяСкидка = Элементы.Вставить("Скидка",Тип("ГруппаФормы"),ЭтаФорма,Элементы.Страницы);
	ГруппаСогласованнаяСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
		
	ПолеСогласованнаяСкидка = Элементы.Добавить("ДП_СогласованнаяСкидка", Тип("ПолеФормы"),Элементы.Скидка); 
	ПолеСогласованнаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
	ПолеСогласованнаяСкидка.ПутьКДанным = "Объект.ДП_СогласованнаяСкидка";
	ПолеСогласованнаяСкидка.УстановитьДействие("ПриИзменении","СогласованнаяСкидкаПриИзмененииПосле");
	
	ПересчитатьТаблицу = Команды.Добавить("ПересчитатьТаблицу");
	ПересчитатьТаблицу.Заголовок = "ПересчитатьТаблицу";
	ПересчитатьТаблицу.Действие = "ПересчитатьТаблицуПосле"; //указываем только имя процедуры
	КнопкаПересчитатьТаблицу = ЭтаФорма.Элементы.Добавить("ПересчитатьТаблицу", Тип("КнопкаФормы"),Элементы.Скидка);
	КнопкаПересчитатьТаблицу.Заголовок = "Пересчитать таблицу";
	КнопкаПересчитатьТаблицу.ИмяКоманды = "ПересчитатьТаблицу";
	
	Декорация = ЭтаФорма.Элементы.Добавить("Декорация", Тип("ДекорацияФормы"),Элементы.Скидка);
	Декорация.Вид = ВидДекорацииФормы.Надпись;
	
	//+++++

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
    //КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
    //ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;

	//+++++
	//Петухов Д.: Изменение пересчета суммы 

	// ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество;
	
    ИтоговаяСкидка = ТекущиеДанные.Скидка + Объект.ДП_СогласованнаяСкидка;
    Если ИтоговаяСкидка > 100 Тогда
        
        ИтоговаяСкидка = 100;
        Сообщение = Новый СообщениеПользователю;
        //Сообщение.Поле = "Объект.Товары[" + (ТекущиеДанные.НомерСтроки-1) + "].Скидка";
        Сообщение.Текст = "Совокупная скидка более 100%";
        Сообщение.Сообщить();
        
    КонецЕсли;
    
    КоэффициентСкидки = 1 - ИтоговаяСкидка / 100;
    
    ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	//+++++
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

&НаКлиенте
Процедура ПересчитатьТаблицуПосле(Команда)
    //+++++
	//Петухов Д.: Пересчет таблицы по кнопке
	
    ПересчитатьТаблицу();
    
КонецПроцедуры

&НаКлиенте
Процедура ПересчитатьТаблицу()
	//+++++
	//Петухов Д.: Пересчет таблицы
    
    Для Каждого ТекущиеДанные  Из Объект.Товары Цикл
        
        РассчитатьСуммуСтроки(ТекущиеДанные);
        
    КонецЦикла;
    
    Для Каждого ТекущиеДанные  Из Объект.Услуги Цикл
        
       РассчитатьСуммуСтроки(ТекущиеДанные);
        
    КонецЦикла;
    
    РассчитатьСуммуДокумента();
    
    Элементы.Декорация.Заголовок = "";
    Элементы.Декорация.ЦветФона = WebЦвета.Белый;
    
КонецПроцедуры

&НаКлиенте
Асинх Процедура СогласованнаяСкидкаПриИзмененииПосле(Элемент)
    //+++++
	//Петухов Д.: обработка изменения скидки
    КоличествоСтрокТовары = Объект.Товары.Количество();
    КоличествоСтрокУслуги = Объект.Услуги.Количество();
    
    Если КоличествоСтрокТовары > 0 Или  КоличествоСтрокУслуги > 0 Тогда
        
        Ответ = Ждать ВопросАсинх(НСтр("ru = 'Вы изменили согласованную скидку. Пересчитать таблицу?'"), РежимДиалогаВопрос.ДаНет);  
        
        Если  Ответ = КодВозвратаДиалога.Да Тогда
            
            ПересчитатьТаблицу()
            
        Иначе     
            
            Элементы.Декорация.Заголовок = "Вы изменили согласованную скидку. Пересчитайте таблицу";
            Элементы.Декорация.ЦветФона = WebЦвета.Красный;
            Элементы.Декорация.ЦветТекста = WebЦвета.Белый; 
            
        КонецЕсли;
        
    Иначе
        
        Возврат;
        
    КонецЕсли;
    
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
