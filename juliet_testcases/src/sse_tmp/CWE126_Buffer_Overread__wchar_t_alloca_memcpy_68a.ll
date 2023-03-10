; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_goodG2BData = dso_local global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
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
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_badData, align 8, !dbg !45
  call void (...) @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68b_badSink(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #4, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #4, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 200, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = alloca i8, i64 400, align 16, !dbg !80
  %3 = bitcast i8* %2 to i32*, !dbg !81
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !79
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !82
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !83
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !86
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !87
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !88
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !88
  store i32 0, i32* %arrayidx2, align 4, !dbg !89
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !90
  store i32* %8, i32** %data, align 8, !dbg !91
  %9 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_goodG2BData, align 8, !dbg !93
  call void (...) @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68b_goodG2BSink(), !dbg !94
  ret void, !dbg !95
}

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_bad", scope: !14, file: !14, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 32, type: !6)
!27 = !DILocation(line: 32, column: 15, scope: !21)
!28 = !DILocation(line: 32, column: 42, scope: !21)
!29 = !DILocation(line: 32, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 33, type: !6)
!31 = !DILocation(line: 33, column: 15, scope: !21)
!32 = !DILocation(line: 33, column: 43, scope: !21)
!33 = !DILocation(line: 33, column: 32, scope: !21)
!34 = !DILocation(line: 34, column: 13, scope: !21)
!35 = !DILocation(line: 34, column: 5, scope: !21)
!36 = !DILocation(line: 35, column: 5, scope: !21)
!37 = !DILocation(line: 35, column: 25, scope: !21)
!38 = !DILocation(line: 36, column: 13, scope: !21)
!39 = !DILocation(line: 36, column: 5, scope: !21)
!40 = !DILocation(line: 37, column: 5, scope: !21)
!41 = !DILocation(line: 37, column: 27, scope: !21)
!42 = !DILocation(line: 39, column: 12, scope: !21)
!43 = !DILocation(line: 39, column: 10, scope: !21)
!44 = !DILocation(line: 40, column: 64, scope: !21)
!45 = !DILocation(line: 40, column: 62, scope: !21)
!46 = !DILocation(line: 41, column: 5, scope: !21)
!47 = !DILocation(line: 42, column: 1, scope: !21)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_68_good", scope: !14, file: !14, line: 67, type: !22, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 69, column: 5, scope: !48)
!50 = !DILocation(line: 70, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !52, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!9, !9, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 82, type: !9)
!58 = !DILocation(line: 82, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 82, type: !54)
!60 = !DILocation(line: 82, column: 27, scope: !51)
!61 = !DILocation(line: 85, column: 22, scope: !51)
!62 = !DILocation(line: 85, column: 12, scope: !51)
!63 = !DILocation(line: 85, column: 5, scope: !51)
!64 = !DILocation(line: 87, column: 5, scope: !51)
!65 = !DILocation(line: 88, column: 5, scope: !51)
!66 = !DILocation(line: 89, column: 5, scope: !51)
!67 = !DILocation(line: 92, column: 5, scope: !51)
!68 = !DILocation(line: 93, column: 5, scope: !51)
!69 = !DILocation(line: 94, column: 5, scope: !51)
!70 = !DILocation(line: 96, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !22, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 54, type: !6)
!73 = !DILocation(line: 54, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !14, line: 55, type: !6)
!75 = !DILocation(line: 55, column: 15, scope: !71)
!76 = !DILocation(line: 55, column: 42, scope: !71)
!77 = !DILocation(line: 55, column: 31, scope: !71)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !14, line: 56, type: !6)
!79 = !DILocation(line: 56, column: 15, scope: !71)
!80 = !DILocation(line: 56, column: 43, scope: !71)
!81 = !DILocation(line: 56, column: 32, scope: !71)
!82 = !DILocation(line: 57, column: 13, scope: !71)
!83 = !DILocation(line: 57, column: 5, scope: !71)
!84 = !DILocation(line: 58, column: 5, scope: !71)
!85 = !DILocation(line: 58, column: 25, scope: !71)
!86 = !DILocation(line: 59, column: 13, scope: !71)
!87 = !DILocation(line: 59, column: 5, scope: !71)
!88 = !DILocation(line: 60, column: 5, scope: !71)
!89 = !DILocation(line: 60, column: 27, scope: !71)
!90 = !DILocation(line: 62, column: 12, scope: !71)
!91 = !DILocation(line: 62, column: 10, scope: !71)
!92 = !DILocation(line: 63, column: 68, scope: !71)
!93 = !DILocation(line: 63, column: 66, scope: !71)
!94 = !DILocation(line: 64, column: 5, scope: !71)
!95 = !DILocation(line: 65, column: 1, scope: !71)
