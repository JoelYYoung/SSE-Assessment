; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_65a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !25
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
  %9 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !44
  %10 = load i32*, i32** %data, align 8, !dbg !45
  call void %9(i32* %10), !dbg !44
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65b_badSink(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #4, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #4, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !73, metadata !DIExpression()), !dbg !74
  store void (i32*)* @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 200, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = alloca i8, i64 400, align 16, !dbg !81
  %3 = bitcast i8* %2 to i32*, !dbg !82
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !80
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !83
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #4, !dbg !84
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !87
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #4, !dbg !88
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !89
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !89
  store i32 0, i32* %arrayidx2, align 4, !dbg !90
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !91
  store i32* %8, i32** %data, align 8, !dbg !92
  %9 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !93
  %10 = load i32*, i32** %data, align 8, !dbg !94
  call void %9(i32* %10), !dbg !93
  ret void, !dbg !95
}

declare dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_65b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_65_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_65a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!27 = !DILocation(line: 31, column: 15, scope: !15)
!28 = !DILocation(line: 31, column: 42, scope: !15)
!29 = !DILocation(line: 31, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!31 = !DILocation(line: 32, column: 15, scope: !15)
!32 = !DILocation(line: 32, column: 43, scope: !15)
!33 = !DILocation(line: 32, column: 32, scope: !15)
!34 = !DILocation(line: 33, column: 13, scope: !15)
!35 = !DILocation(line: 33, column: 5, scope: !15)
!36 = !DILocation(line: 34, column: 5, scope: !15)
!37 = !DILocation(line: 34, column: 25, scope: !15)
!38 = !DILocation(line: 35, column: 13, scope: !15)
!39 = !DILocation(line: 35, column: 5, scope: !15)
!40 = !DILocation(line: 36, column: 5, scope: !15)
!41 = !DILocation(line: 36, column: 27, scope: !15)
!42 = !DILocation(line: 38, column: 12, scope: !15)
!43 = !DILocation(line: 38, column: 10, scope: !15)
!44 = !DILocation(line: 40, column: 5, scope: !15)
!45 = !DILocation(line: 40, column: 13, scope: !15)
!46 = !DILocation(line: 41, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_65_good", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 67, column: 5, scope: !47)
!49 = !DILocation(line: 68, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 80, type: !51, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !16, line: 80, type: !7)
!57 = !DILocation(line: 80, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !16, line: 80, type: !53)
!59 = !DILocation(line: 80, column: 27, scope: !50)
!60 = !DILocation(line: 83, column: 22, scope: !50)
!61 = !DILocation(line: 83, column: 12, scope: !50)
!62 = !DILocation(line: 83, column: 5, scope: !50)
!63 = !DILocation(line: 85, column: 5, scope: !50)
!64 = !DILocation(line: 86, column: 5, scope: !50)
!65 = !DILocation(line: 87, column: 5, scope: !50)
!66 = !DILocation(line: 90, column: 5, scope: !50)
!67 = !DILocation(line: 91, column: 5, scope: !50)
!68 = !DILocation(line: 92, column: 5, scope: !50)
!69 = !DILocation(line: 94, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !16, line: 52, type: !4)
!72 = !DILocation(line: 52, column: 15, scope: !70)
!73 = !DILocalVariable(name: "funcPtr", scope: !70, file: !16, line: 53, type: !22)
!74 = !DILocation(line: 53, column: 12, scope: !70)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !16, line: 54, type: !4)
!76 = !DILocation(line: 54, column: 15, scope: !70)
!77 = !DILocation(line: 54, column: 42, scope: !70)
!78 = !DILocation(line: 54, column: 31, scope: !70)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !16, line: 55, type: !4)
!80 = !DILocation(line: 55, column: 15, scope: !70)
!81 = !DILocation(line: 55, column: 43, scope: !70)
!82 = !DILocation(line: 55, column: 32, scope: !70)
!83 = !DILocation(line: 56, column: 13, scope: !70)
!84 = !DILocation(line: 56, column: 5, scope: !70)
!85 = !DILocation(line: 57, column: 5, scope: !70)
!86 = !DILocation(line: 57, column: 25, scope: !70)
!87 = !DILocation(line: 58, column: 13, scope: !70)
!88 = !DILocation(line: 58, column: 5, scope: !70)
!89 = !DILocation(line: 59, column: 5, scope: !70)
!90 = !DILocation(line: 59, column: 27, scope: !70)
!91 = !DILocation(line: 61, column: 12, scope: !70)
!92 = !DILocation(line: 61, column: 10, scope: !70)
!93 = !DILocation(line: 62, column: 5, scope: !70)
!94 = !DILocation(line: 62, column: 13, scope: !70)
!95 = !DILocation(line: 63, column: 1, scope: !70)
