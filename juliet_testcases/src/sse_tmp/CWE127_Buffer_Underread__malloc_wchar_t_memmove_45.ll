; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %dataBuffer, align 8, !dbg !30
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !40
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  store i32* %5, i32** @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_badData, align 8, !dbg !47
  call void @badSink(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_good() #0 !dbg !50 {
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
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32*, i32** @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_badData, align 8, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !77, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !84
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %3 = bitcast i32* %2 to i8*, !dbg !87
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !87
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx2, align 4, !dbg !90
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay3), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %dataBuffer, align 8, !dbg !100
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %cmp = icmp eq i32* %1, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !110
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %4, i32** %data, align 8, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  store i32* %5, i32** @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_goodG2BData, align 8, !dbg !116
  call void @goodG2BSink(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32*, i32** @CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_goodG2BData, align 8, !dbg !122
  store i32* %0, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !127
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !130
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %3 = bitcast i32* %2 to i8*, !dbg !130
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx2, align 4, !dbg !133
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  call void @printWLine(i32* %arraydecay3), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_bad", scope: !15, file: !15, line: 43, type: !23, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 45, type: !6)
!26 = !DILocation(line: 45, column: 15, scope: !22)
!27 = !DILocation(line: 46, column: 10, scope: !22)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !15, line: 48, type: !6)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 5)
!30 = !DILocation(line: 48, column: 19, scope: !29)
!31 = !DILocation(line: 48, column: 43, scope: !29)
!32 = !DILocation(line: 48, column: 32, scope: !29)
!33 = !DILocation(line: 49, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !15, line: 49, column: 13)
!35 = !DILocation(line: 49, column: 24, scope: !34)
!36 = !DILocation(line: 49, column: 13, scope: !29)
!37 = !DILocation(line: 49, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 49, column: 33)
!39 = !DILocation(line: 50, column: 17, scope: !29)
!40 = !DILocation(line: 50, column: 9, scope: !29)
!41 = !DILocation(line: 51, column: 9, scope: !29)
!42 = !DILocation(line: 51, column: 27, scope: !29)
!43 = !DILocation(line: 53, column: 16, scope: !29)
!44 = !DILocation(line: 53, column: 27, scope: !29)
!45 = !DILocation(line: 53, column: 14, scope: !29)
!46 = !DILocation(line: 55, column: 66, scope: !22)
!47 = !DILocation(line: 55, column: 64, scope: !22)
!48 = !DILocation(line: 56, column: 5, scope: !22)
!49 = !DILocation(line: 57, column: 1, scope: !22)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_45_good", scope: !15, file: !15, line: 97, type: !23, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 99, column: 5, scope: !50)
!52 = !DILocation(line: 100, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 111, type: !54, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!9, !9, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 111, type: !9)
!60 = !DILocation(line: 111, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 111, type: !56)
!62 = !DILocation(line: 111, column: 27, scope: !53)
!63 = !DILocation(line: 114, column: 22, scope: !53)
!64 = !DILocation(line: 114, column: 12, scope: !53)
!65 = !DILocation(line: 114, column: 5, scope: !53)
!66 = !DILocation(line: 116, column: 5, scope: !53)
!67 = !DILocation(line: 117, column: 5, scope: !53)
!68 = !DILocation(line: 118, column: 5, scope: !53)
!69 = !DILocation(line: 121, column: 5, scope: !53)
!70 = !DILocation(line: 122, column: 5, scope: !53)
!71 = !DILocation(line: 123, column: 5, scope: !53)
!72 = !DILocation(line: 125, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 28, type: !6)
!75 = !DILocation(line: 28, column: 15, scope: !73)
!76 = !DILocation(line: 28, column: 22, scope: !73)
!77 = !DILocalVariable(name: "dest", scope: !78, file: !15, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !73, file: !15, line: 29, column: 5)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 100)
!82 = !DILocation(line: 30, column: 17, scope: !78)
!83 = !DILocation(line: 31, column: 17, scope: !78)
!84 = !DILocation(line: 31, column: 9, scope: !78)
!85 = !DILocation(line: 32, column: 9, scope: !78)
!86 = !DILocation(line: 32, column: 21, scope: !78)
!87 = !DILocation(line: 34, column: 9, scope: !78)
!88 = !DILocation(line: 34, column: 23, scope: !78)
!89 = !DILocation(line: 36, column: 9, scope: !78)
!90 = !DILocation(line: 36, column: 21, scope: !78)
!91 = !DILocation(line: 37, column: 20, scope: !78)
!92 = !DILocation(line: 37, column: 9, scope: !78)
!93 = !DILocation(line: 41, column: 1, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 81, type: !23, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 83, type: !6)
!96 = !DILocation(line: 83, column: 15, scope: !94)
!97 = !DILocation(line: 84, column: 10, scope: !94)
!98 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !15, line: 86, type: !6)
!99 = distinct !DILexicalBlock(scope: !94, file: !15, line: 85, column: 5)
!100 = !DILocation(line: 86, column: 19, scope: !99)
!101 = !DILocation(line: 86, column: 43, scope: !99)
!102 = !DILocation(line: 86, column: 32, scope: !99)
!103 = !DILocation(line: 87, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 87, column: 13)
!105 = !DILocation(line: 87, column: 24, scope: !104)
!106 = !DILocation(line: 87, column: 13, scope: !99)
!107 = !DILocation(line: 87, column: 34, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 87, column: 33)
!109 = !DILocation(line: 88, column: 17, scope: !99)
!110 = !DILocation(line: 88, column: 9, scope: !99)
!111 = !DILocation(line: 89, column: 9, scope: !99)
!112 = !DILocation(line: 89, column: 27, scope: !99)
!113 = !DILocation(line: 91, column: 16, scope: !99)
!114 = !DILocation(line: 91, column: 14, scope: !99)
!115 = !DILocation(line: 93, column: 70, scope: !94)
!116 = !DILocation(line: 93, column: 68, scope: !94)
!117 = !DILocation(line: 94, column: 5, scope: !94)
!118 = !DILocation(line: 95, column: 1, scope: !94)
!119 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 64, type: !23, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 66, type: !6)
!121 = !DILocation(line: 66, column: 15, scope: !119)
!122 = !DILocation(line: 66, column: 22, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 68, type: !79)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 67, column: 5)
!125 = !DILocation(line: 68, column: 17, scope: !124)
!126 = !DILocation(line: 69, column: 17, scope: !124)
!127 = !DILocation(line: 69, column: 9, scope: !124)
!128 = !DILocation(line: 70, column: 9, scope: !124)
!129 = !DILocation(line: 70, column: 21, scope: !124)
!130 = !DILocation(line: 72, column: 9, scope: !124)
!131 = !DILocation(line: 72, column: 23, scope: !124)
!132 = !DILocation(line: 74, column: 9, scope: !124)
!133 = !DILocation(line: 74, column: 21, scope: !124)
!134 = !DILocation(line: 75, column: 20, scope: !124)
!135 = !DILocation(line: 75, column: 9, scope: !124)
!136 = !DILocation(line: 79, column: 1, scope: !119)
