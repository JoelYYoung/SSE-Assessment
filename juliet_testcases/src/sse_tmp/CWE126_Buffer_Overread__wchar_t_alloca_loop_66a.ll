; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_66a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  store i32* %8, i32** %data, align 8, !dbg !43
  %9 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx3 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !45
  store i32* %9, i32** %arrayidx3, align 16, !dbg !46
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !47
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66b_badSink(i32** %arraydecay), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #4, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #4, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 200, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = alloca i8, i64 400, align 16, !dbg !84
  %3 = bitcast i8* %2 to i32*, !dbg !85
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !83
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !86
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !87
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !91
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !92
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !92
  store i32 0, i32* %arrayidx2, align 4, !dbg !93
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !94
  store i32* %8, i32** %data, align 8, !dbg !95
  %9 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx3 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !97
  store i32* %9, i32** %arrayidx3, align 16, !dbg !98
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !99
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66b_goodG2BSink(i32** %arraydecay), !dbg !100
  ret void, !dbg !101
}

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_66b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_66_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataArray", scope: !15, file: !16, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 29, column: 15, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 30, type: !4)
!27 = !DILocation(line: 30, column: 15, scope: !15)
!28 = !DILocation(line: 30, column: 42, scope: !15)
!29 = !DILocation(line: 30, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 31, type: !4)
!31 = !DILocation(line: 31, column: 15, scope: !15)
!32 = !DILocation(line: 31, column: 43, scope: !15)
!33 = !DILocation(line: 31, column: 32, scope: !15)
!34 = !DILocation(line: 32, column: 13, scope: !15)
!35 = !DILocation(line: 32, column: 5, scope: !15)
!36 = !DILocation(line: 33, column: 5, scope: !15)
!37 = !DILocation(line: 33, column: 25, scope: !15)
!38 = !DILocation(line: 34, column: 13, scope: !15)
!39 = !DILocation(line: 34, column: 5, scope: !15)
!40 = !DILocation(line: 35, column: 5, scope: !15)
!41 = !DILocation(line: 35, column: 27, scope: !15)
!42 = !DILocation(line: 37, column: 12, scope: !15)
!43 = !DILocation(line: 37, column: 10, scope: !15)
!44 = !DILocation(line: 39, column: 20, scope: !15)
!45 = !DILocation(line: 39, column: 5, scope: !15)
!46 = !DILocation(line: 39, column: 18, scope: !15)
!47 = !DILocation(line: 40, column: 61, scope: !15)
!48 = !DILocation(line: 40, column: 5, scope: !15)
!49 = !DILocation(line: 41, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_66_good", scope: !16, file: !16, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 68, column: 5, scope: !50)
!52 = !DILocation(line: 69, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 81, type: !54, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !16, line: 81, type: !7)
!60 = !DILocation(line: 81, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !16, line: 81, type: !56)
!62 = !DILocation(line: 81, column: 27, scope: !53)
!63 = !DILocation(line: 84, column: 22, scope: !53)
!64 = !DILocation(line: 84, column: 12, scope: !53)
!65 = !DILocation(line: 84, column: 5, scope: !53)
!66 = !DILocation(line: 86, column: 5, scope: !53)
!67 = !DILocation(line: 87, column: 5, scope: !53)
!68 = !DILocation(line: 88, column: 5, scope: !53)
!69 = !DILocation(line: 91, column: 5, scope: !53)
!70 = !DILocation(line: 92, column: 5, scope: !53)
!71 = !DILocation(line: 93, column: 5, scope: !53)
!72 = !DILocation(line: 95, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !16, line: 52, type: !4)
!75 = !DILocation(line: 52, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataArray", scope: !73, file: !16, line: 53, type: !22)
!77 = !DILocation(line: 53, column: 15, scope: !73)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !16, line: 54, type: !4)
!79 = !DILocation(line: 54, column: 15, scope: !73)
!80 = !DILocation(line: 54, column: 42, scope: !73)
!81 = !DILocation(line: 54, column: 31, scope: !73)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !16, line: 55, type: !4)
!83 = !DILocation(line: 55, column: 15, scope: !73)
!84 = !DILocation(line: 55, column: 43, scope: !73)
!85 = !DILocation(line: 55, column: 32, scope: !73)
!86 = !DILocation(line: 56, column: 13, scope: !73)
!87 = !DILocation(line: 56, column: 5, scope: !73)
!88 = !DILocation(line: 57, column: 5, scope: !73)
!89 = !DILocation(line: 57, column: 25, scope: !73)
!90 = !DILocation(line: 58, column: 13, scope: !73)
!91 = !DILocation(line: 58, column: 5, scope: !73)
!92 = !DILocation(line: 59, column: 5, scope: !73)
!93 = !DILocation(line: 59, column: 27, scope: !73)
!94 = !DILocation(line: 61, column: 12, scope: !73)
!95 = !DILocation(line: 61, column: 10, scope: !73)
!96 = !DILocation(line: 62, column: 20, scope: !73)
!97 = !DILocation(line: 62, column: 5, scope: !73)
!98 = !DILocation(line: 62, column: 18, scope: !73)
!99 = !DILocation(line: 63, column: 65, scope: !73)
!100 = !DILocation(line: 63, column: 5, scope: !73)
!101 = !DILocation(line: 64, column: 1, scope: !73)
