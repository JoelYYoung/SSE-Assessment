; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !27
  %1 = load i32*, i32** %data.addr, align 8, !dbg !28
  %call = call i32* @wcscat(i32* %arraydecay, i32* %1) #5, !dbg !29
  %2 = load i32*, i32** %data.addr, align 8, !dbg !30
  call void @printWLine(i32* %2), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = alloca i8, i64 400, align 16, !dbg !40
  %1 = bitcast i8* %0 to i32*, !dbg !41
  store i32* %1, i32** %dataBuffer, align 8, !dbg !39
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  store i32* %2, i32** %data, align 8, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_badSink(i32* %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_goodG2BSink(i32* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !56
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !56
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !57
  %1 = load i32*, i32** %data.addr, align 8, !dbg !58
  %call = call i32* @wcscat(i32* %arraydecay, i32* %1) #5, !dbg !59
  %2 = load i32*, i32** %data.addr, align 8, !dbg !60
  call void @printWLine(i32* %2), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 400, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBuffer, align 8, !dbg !90
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  store i32* %2, i32** %data, align 8, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_goodG2BSink(i32* %5), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 86, scope: !15)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 28, column: 16, scope: !22)
!28 = !DILocation(line: 28, column: 22, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 29, column: 20, scope: !22)
!31 = !DILocation(line: 29, column: 9, scope: !22)
!32 = !DILocation(line: 31, column: 1, scope: !15)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_bad", scope: !16, file: !16, line: 33, type: !34, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 35, type: !4)
!37 = !DILocation(line: 35, column: 15, scope: !33)
!38 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !16, line: 36, type: !4)
!39 = !DILocation(line: 36, column: 15, scope: !33)
!40 = !DILocation(line: 36, column: 39, scope: !33)
!41 = !DILocation(line: 36, column: 28, scope: !33)
!42 = !DILocation(line: 37, column: 12, scope: !33)
!43 = !DILocation(line: 37, column: 10, scope: !33)
!44 = !DILocation(line: 39, column: 13, scope: !33)
!45 = !DILocation(line: 39, column: 5, scope: !33)
!46 = !DILocation(line: 40, column: 5, scope: !33)
!47 = !DILocation(line: 40, column: 17, scope: !33)
!48 = !DILocation(line: 41, column: 75, scope: !33)
!49 = !DILocation(line: 41, column: 5, scope: !33)
!50 = !DILocation(line: 42, column: 1, scope: !33)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_goodG2BSink", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !16, line: 48, type: !4)
!53 = !DILocation(line: 48, column: 90, scope: !51)
!54 = !DILocalVariable(name: "dest", scope: !55, file: !16, line: 51, type: !23)
!55 = distinct !DILexicalBlock(scope: !51, file: !16, line: 50, column: 5)
!56 = !DILocation(line: 51, column: 17, scope: !55)
!57 = !DILocation(line: 53, column: 16, scope: !55)
!58 = !DILocation(line: 53, column: 22, scope: !55)
!59 = !DILocation(line: 53, column: 9, scope: !55)
!60 = !DILocation(line: 54, column: 20, scope: !55)
!61 = !DILocation(line: 54, column: 9, scope: !55)
!62 = !DILocation(line: 56, column: 1, scope: !51)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_41_good", scope: !16, file: !16, line: 70, type: !34, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 72, column: 5, scope: !63)
!65 = !DILocation(line: 73, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 85, type: !67, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !16, line: 85, type: !7)
!73 = !DILocation(line: 85, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !16, line: 85, type: !69)
!75 = !DILocation(line: 85, column: 27, scope: !66)
!76 = !DILocation(line: 88, column: 22, scope: !66)
!77 = !DILocation(line: 88, column: 12, scope: !66)
!78 = !DILocation(line: 88, column: 5, scope: !66)
!79 = !DILocation(line: 90, column: 5, scope: !66)
!80 = !DILocation(line: 91, column: 5, scope: !66)
!81 = !DILocation(line: 92, column: 5, scope: !66)
!82 = !DILocation(line: 95, column: 5, scope: !66)
!83 = !DILocation(line: 96, column: 5, scope: !66)
!84 = !DILocation(line: 97, column: 5, scope: !66)
!85 = !DILocation(line: 99, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !34, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !16, line: 61, type: !4)
!88 = !DILocation(line: 61, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !16, line: 62, type: !4)
!90 = !DILocation(line: 62, column: 15, scope: !86)
!91 = !DILocation(line: 62, column: 39, scope: !86)
!92 = !DILocation(line: 62, column: 28, scope: !86)
!93 = !DILocation(line: 63, column: 12, scope: !86)
!94 = !DILocation(line: 63, column: 10, scope: !86)
!95 = !DILocation(line: 65, column: 13, scope: !86)
!96 = !DILocation(line: 65, column: 5, scope: !86)
!97 = !DILocation(line: 66, column: 5, scope: !86)
!98 = !DILocation(line: 66, column: 16, scope: !86)
!99 = !DILocation(line: 67, column: 79, scope: !86)
!100 = !DILocation(line: 67, column: 5, scope: !86)
!101 = !DILocation(line: 68, column: 1, scope: !86)
