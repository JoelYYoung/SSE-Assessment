; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !53
  store i32 0, i32* %arrayidx5, align 4, !dbg !54
  %9 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %dataBuffer, align 8, !dbg !87
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !97
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %4, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !106
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx3, align 4, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  %6 = bitcast i32* %5 to i8*, !dbg !110
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !110
  %8 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %9 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %9), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 28, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 5)
!25 = !DILocation(line: 28, column: 19, scope: !24)
!26 = !DILocation(line: 28, column: 43, scope: !24)
!27 = !DILocation(line: 28, column: 32, scope: !24)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 24, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !24)
!32 = !DILocation(line: 29, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 33)
!34 = !DILocation(line: 30, column: 17, scope: !24)
!35 = !DILocation(line: 30, column: 9, scope: !24)
!36 = !DILocation(line: 31, column: 9, scope: !24)
!37 = !DILocation(line: 31, column: 27, scope: !24)
!38 = !DILocation(line: 33, column: 16, scope: !24)
!39 = !DILocation(line: 33, column: 27, scope: !24)
!40 = !DILocation(line: 33, column: 14, scope: !24)
!41 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocation(line: 37, column: 17, scope: !42)
!48 = !DILocation(line: 37, column: 9, scope: !42)
!49 = !DILocation(line: 38, column: 9, scope: !42)
!50 = !DILocation(line: 38, column: 23, scope: !42)
!51 = !DILocation(line: 40, column: 16, scope: !42)
!52 = !DILocation(line: 40, column: 9, scope: !42)
!53 = !DILocation(line: 42, column: 9, scope: !42)
!54 = !DILocation(line: 42, column: 21, scope: !42)
!55 = !DILocation(line: 43, column: 20, scope: !42)
!56 = !DILocation(line: 43, column: 9, scope: !42)
!57 = !DILocation(line: 47, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_01_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 82, column: 5, scope: !58)
!60 = !DILocation(line: 83, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !62, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 95, type: !7)
!68 = !DILocation(line: 95, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 95, type: !64)
!70 = !DILocation(line: 95, column: 27, scope: !61)
!71 = !DILocation(line: 98, column: 22, scope: !61)
!72 = !DILocation(line: 98, column: 12, scope: !61)
!73 = !DILocation(line: 98, column: 5, scope: !61)
!74 = !DILocation(line: 100, column: 5, scope: !61)
!75 = !DILocation(line: 101, column: 5, scope: !61)
!76 = !DILocation(line: 102, column: 5, scope: !61)
!77 = !DILocation(line: 105, column: 5, scope: !61)
!78 = !DILocation(line: 106, column: 5, scope: !61)
!79 = !DILocation(line: 107, column: 5, scope: !61)
!80 = !DILocation(line: 109, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !17, line: 56, type: !4)
!83 = !DILocation(line: 56, column: 15, scope: !81)
!84 = !DILocation(line: 57, column: 10, scope: !81)
!85 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !17, line: 59, type: !4)
!86 = distinct !DILexicalBlock(scope: !81, file: !17, line: 58, column: 5)
!87 = !DILocation(line: 59, column: 19, scope: !86)
!88 = !DILocation(line: 59, column: 43, scope: !86)
!89 = !DILocation(line: 59, column: 32, scope: !86)
!90 = !DILocation(line: 60, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !17, line: 60, column: 13)
!92 = !DILocation(line: 60, column: 24, scope: !91)
!93 = !DILocation(line: 60, column: 13, scope: !86)
!94 = !DILocation(line: 60, column: 34, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !17, line: 60, column: 33)
!96 = !DILocation(line: 61, column: 17, scope: !86)
!97 = !DILocation(line: 61, column: 9, scope: !86)
!98 = !DILocation(line: 62, column: 9, scope: !86)
!99 = !DILocation(line: 62, column: 27, scope: !86)
!100 = !DILocation(line: 64, column: 16, scope: !86)
!101 = !DILocation(line: 64, column: 14, scope: !86)
!102 = !DILocalVariable(name: "source", scope: !103, file: !17, line: 67, type: !43)
!103 = distinct !DILexicalBlock(scope: !81, file: !17, line: 66, column: 5)
!104 = !DILocation(line: 67, column: 17, scope: !103)
!105 = !DILocation(line: 68, column: 17, scope: !103)
!106 = !DILocation(line: 68, column: 9, scope: !103)
!107 = !DILocation(line: 69, column: 9, scope: !103)
!108 = !DILocation(line: 69, column: 23, scope: !103)
!109 = !DILocation(line: 71, column: 16, scope: !103)
!110 = !DILocation(line: 71, column: 9, scope: !103)
!111 = !DILocation(line: 73, column: 9, scope: !103)
!112 = !DILocation(line: 73, column: 21, scope: !103)
!113 = !DILocation(line: 74, column: 20, scope: !103)
!114 = !DILocation(line: 74, column: 9, scope: !103)
!115 = !DILocation(line: 78, column: 1, scope: !81)
