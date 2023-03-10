; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %2 = bitcast i32* %1 to i8*, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !38
  store i32 0, i32* %arrayidx3, align 4, !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* %5), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !48, metadata !DIExpression()), !dbg !50
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !51
  %0 = bitcast i8* %call to i32*, !dbg !52
  store i32* %0, i32** %dataBuffer, align 8, !dbg !50
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i32* %1, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !60
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !64
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !65
  %5 = load i32*, i32** %data.addr, align 8, !dbg !66
  ret i32* %5, !dbg !67
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @goodG2BSource(i32* %0), !dbg !96
  store i32* %call, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !102
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %2 = bitcast i32* %1 to i8*, !dbg !106
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !106
  %4 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !107
  store i32 0, i32* %arrayidx3, align 4, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %5), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !117
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !118
  %0 = bitcast i8* %call to i32*, !dbg !119
  store i32* %0, i32** %dataBuffer, align 8, !dbg !117
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !120
  %cmp = icmp eq i32* %1, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !127
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  store i32* %4, i32** %data.addr, align 8, !dbg !131
  %5 = load i32*, i32** %data.addr, align 8, !dbg !132
  ret i32* %5, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocation(line: 43, column: 17, scope: !27)
!33 = !DILocation(line: 43, column: 9, scope: !27)
!34 = !DILocation(line: 44, column: 9, scope: !27)
!35 = !DILocation(line: 44, column: 23, scope: !27)
!36 = !DILocation(line: 46, column: 16, scope: !27)
!37 = !DILocation(line: 46, column: 9, scope: !27)
!38 = !DILocation(line: 48, column: 9, scope: !27)
!39 = !DILocation(line: 48, column: 21, scope: !27)
!40 = !DILocation(line: 49, column: 20, scope: !27)
!41 = !DILocation(line: 49, column: 9, scope: !27)
!42 = !DILocation(line: 53, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !44, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!5, !5}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 23, type: !5)
!47 = !DILocation(line: 23, column: 38, scope: !43)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !17, line: 26, type: !5)
!49 = distinct !DILexicalBlock(scope: !43, file: !17, line: 25, column: 5)
!50 = !DILocation(line: 26, column: 19, scope: !49)
!51 = !DILocation(line: 26, column: 43, scope: !49)
!52 = !DILocation(line: 26, column: 32, scope: !49)
!53 = !DILocation(line: 27, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !17, line: 27, column: 13)
!55 = !DILocation(line: 27, column: 24, scope: !54)
!56 = !DILocation(line: 27, column: 13, scope: !49)
!57 = !DILocation(line: 27, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 27, column: 33)
!59 = !DILocation(line: 28, column: 17, scope: !49)
!60 = !DILocation(line: 28, column: 9, scope: !49)
!61 = !DILocation(line: 29, column: 9, scope: !49)
!62 = !DILocation(line: 29, column: 27, scope: !49)
!63 = !DILocation(line: 31, column: 16, scope: !49)
!64 = !DILocation(line: 31, column: 27, scope: !49)
!65 = !DILocation(line: 31, column: 14, scope: !49)
!66 = !DILocation(line: 33, column: 12, scope: !43)
!67 = !DILocation(line: 33, column: 5, scope: !43)
!68 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_42_good", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 94, column: 5, scope: !68)
!70 = !DILocation(line: 95, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 107, type: !72, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!8, !8, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !17, line: 107, type: !8)
!78 = !DILocation(line: 107, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !17, line: 107, type: !74)
!80 = !DILocation(line: 107, column: 27, scope: !71)
!81 = !DILocation(line: 110, column: 22, scope: !71)
!82 = !DILocation(line: 110, column: 12, scope: !71)
!83 = !DILocation(line: 110, column: 5, scope: !71)
!84 = !DILocation(line: 112, column: 5, scope: !71)
!85 = !DILocation(line: 113, column: 5, scope: !71)
!86 = !DILocation(line: 114, column: 5, scope: !71)
!87 = !DILocation(line: 117, column: 5, scope: !71)
!88 = !DILocation(line: 118, column: 5, scope: !71)
!89 = !DILocation(line: 119, column: 5, scope: !71)
!90 = !DILocation(line: 121, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 75, type: !5)
!93 = !DILocation(line: 75, column: 15, scope: !91)
!94 = !DILocation(line: 76, column: 10, scope: !91)
!95 = !DILocation(line: 77, column: 26, scope: !91)
!96 = !DILocation(line: 77, column: 12, scope: !91)
!97 = !DILocation(line: 77, column: 10, scope: !91)
!98 = !DILocalVariable(name: "source", scope: !99, file: !17, line: 79, type: !28)
!99 = distinct !DILexicalBlock(scope: !91, file: !17, line: 78, column: 5)
!100 = !DILocation(line: 79, column: 17, scope: !99)
!101 = !DILocation(line: 80, column: 17, scope: !99)
!102 = !DILocation(line: 80, column: 9, scope: !99)
!103 = !DILocation(line: 81, column: 9, scope: !99)
!104 = !DILocation(line: 81, column: 23, scope: !99)
!105 = !DILocation(line: 83, column: 16, scope: !99)
!106 = !DILocation(line: 83, column: 9, scope: !99)
!107 = !DILocation(line: 85, column: 9, scope: !99)
!108 = !DILocation(line: 85, column: 21, scope: !99)
!109 = !DILocation(line: 86, column: 20, scope: !99)
!110 = !DILocation(line: 86, column: 9, scope: !99)
!111 = !DILocation(line: 90, column: 1, scope: !91)
!112 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 59, type: !44, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !17, line: 59, type: !5)
!114 = !DILocation(line: 59, column: 42, scope: !112)
!115 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !17, line: 62, type: !5)
!116 = distinct !DILexicalBlock(scope: !112, file: !17, line: 61, column: 5)
!117 = !DILocation(line: 62, column: 19, scope: !116)
!118 = !DILocation(line: 62, column: 43, scope: !116)
!119 = !DILocation(line: 62, column: 32, scope: !116)
!120 = !DILocation(line: 63, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !17, line: 63, column: 13)
!122 = !DILocation(line: 63, column: 24, scope: !121)
!123 = !DILocation(line: 63, column: 13, scope: !116)
!124 = !DILocation(line: 63, column: 34, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !17, line: 63, column: 33)
!126 = !DILocation(line: 64, column: 17, scope: !116)
!127 = !DILocation(line: 64, column: 9, scope: !116)
!128 = !DILocation(line: 65, column: 9, scope: !116)
!129 = !DILocation(line: 65, column: 27, scope: !116)
!130 = !DILocation(line: 67, column: 16, scope: !116)
!131 = !DILocation(line: 67, column: 14, scope: !116)
!132 = !DILocation(line: 69, column: 12, scope: !112)
!133 = !DILocation(line: 69, column: 5, scope: !112)
