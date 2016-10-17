/* globals require */

/*!
 * Module dependencies.
 */

var cordova = require('./helper/cordova'),
    Underling = require('../www/underling'),
    execSpy,
    execWin,
    options;

/*!
 * Specification.
 */

describe('cordova-plugin-underling', function () {
    beforeEach(function () {
        execWin = jasmine.createSpy();
        execSpy = spyOn(cordova.required, 'cordova/exec').andCallFake(execWin);
    });

    describe('Underling', function () {
      it("Underling plugin should exist", function() {
          expect(Underling).toBeDefined();
          expect(typeof Underling == 'object').toBe(true);
      });

      it("should contain a start function", function() {
          expect(Underling.start).toBeDefined();
          expect(typeof Underling.start == 'function').toBe(true);
      });

      it("should contain an stop function", function() {
          expect(Underling.stop).toBeDefined();
          expect(typeof Underling.stop == 'function').toBe(true);
      });
    });

    /*
    describe('Underling instance', function () {
        describe('cordova.exec', function () {
            it('should call cordova.exec on next process tick', function (done) {
                Underling.start(function() {}, function() {}, {});
                setTimeout(function () {
                    expect(execSpy).toHaveBeenCalledWith(
                        jasmine.any(Function),
                        jasmine.any(Function),
                        'Underling',
                        'start',
                        jasmine.any(Object)
                    );
                    done();
                }, 100);
            });
        });
    });
    */
});
