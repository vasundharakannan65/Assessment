using AssetManagement.BL.Logics;
using AssetManagement.BL.ViewModels;
using AssetManagement.DA.Data;
using AssetManagement.DA.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AssetManagement.Presentation.Controllers
{
    public class AssetController : Controller
    {
        private readonly AssetBL _assetBL;

        public AssetController(AssetBL assetBL)
        {
            this._assetBL = assetBL;
        }

        //GET: /ASSET/ADDASSET
        [HttpGet]
        public IActionResult AddAsset()
        {
            ViewBag.brands = _assetBL.listOfBrands();

            return View();
        }

        //POST: /ASSET/ADDASSET
        [HttpPost]
        public IActionResult AddAsset(AssetViewModel assetViewModel)
        {
            try
            {
                var result = _assetBL.AddAsset(assetViewModel);

                if (result.Succeeded == true)
                {
                    ViewBag.Msg = "New Asset has been successfully added!";
                    RedirectToAction("ListOfAssets", "Asset");
                }
                else
                {
                    throw new Exception(result.Message);
                }
            }
            catch (Exception e)
            {
                ViewBag.Msg = e.Message;
            }

            return View(assetViewModel);

        }

        //GET: /ASSET/LISTOFASSETS
        [HttpGet]
        public async Task<IActionResult> ListOfAssets(string AssetName)
        {
            try
            {
                if (AssetName == default)
                {
                    IEnumerable<Asset> allAssets = await _assetBL.GetListOfAssets();
                    return View(allAssets);
                }
                else
                {
                    IEnumerable<Asset> particularAsset = await _assetBL.GetAssetByAssetName(AssetName);
                    return View(particularAsset);
                }

                //IEnumerable<Asset> listOfAssets = await _assetBL.GetListOfAssets(AssetName);

                //return View(listOfAssets);
                //Checking whether listOfAsset is succeeded if so return
                //if (listOfAssets.Succeeded == true)
                //{
                //    return View(listOfAssets.Data);
                //}
                //else
                //{
                //    throw new Exception(listOfAssets.Message);
                //}
            }
            catch (Exception e)
            {
                return StatusCode(statusCode: 400, e.Message);
            }
        }

        //GET: /ASSET/ADDASSET
        [HttpGet]
        public IActionResult Checkout(int id)
        {
            
            return View();
        }

        //POST: /ASSET/ADDASSET
        [HttpPost]
        public IActionResult Checkout(CheckoutDetails checkout)
        {
            try
            {
                var result = _assetBL.Checkout(checkout);

                if (result.Succeeded == true)
                {
                    ViewBag.Msg = "Asset has been successfully assigned!";
                    RedirectToAction("ListOfAssets", "Asset");
                }
                else
                {
                    throw new Exception(result.Message);
                }
            }
            catch (Exception e)
            {
                ViewBag.Msg = e.Message;
            }

            return View(checkout);

        }
    }
}
