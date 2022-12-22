; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %5) #6, !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %6), !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %8 = bitcast i32* %7 to i8*, !dbg !48
  call void @free(i8* %8) #6, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !78
  %0 = bitcast i8* %call to i32*, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !80
  %1 = load i32*, i32** %data, align 8, !dbg !81
  %cmp = icmp eq i32* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !87
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %5) #6, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  call void @printWLine(i32* %6), !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  %8 = bitcast i32* %7 to i8*, !dbg !101
  call void @free(i8* %8) #6, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !119
  %3 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !124
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !125
  %5 = load i32*, i32** %data, align 8, !dbg !126
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %5) #6, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %6), !dbg !129
  %7 = load i32*, i32** %data, align 8, !dbg !130
  %8 = bitcast i32* %7 to i8*, !dbg !130
  call void @free(i8* %8) #6, !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06_bad", scope: !17, file: !17, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 29, type: !4)
!21 = !DILocation(line: 29, column: 15, scope: !16)
!22 = !DILocation(line: 30, column: 23, scope: !16)
!23 = !DILocation(line: 30, column: 12, scope: !16)
!24 = !DILocation(line: 30, column: 10, scope: !16)
!25 = !DILocation(line: 31, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 9)
!27 = !DILocation(line: 31, column: 14, scope: !26)
!28 = !DILocation(line: 31, column: 9, scope: !16)
!29 = !DILocation(line: 31, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 31, column: 23)
!31 = !DILocation(line: 35, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !17, line: 33, column: 5)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 8)
!34 = !DILocation(line: 35, column: 9, scope: !32)
!35 = !DILocation(line: 36, column: 9, scope: !32)
!36 = !DILocation(line: 36, column: 21, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !17, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 39, column: 17, scope: !38)
!43 = !DILocation(line: 41, column: 16, scope: !38)
!44 = !DILocation(line: 41, column: 22, scope: !38)
!45 = !DILocation(line: 41, column: 9, scope: !38)
!46 = !DILocation(line: 42, column: 20, scope: !38)
!47 = !DILocation(line: 42, column: 9, scope: !38)
!48 = !DILocation(line: 43, column: 14, scope: !38)
!49 = !DILocation(line: 43, column: 9, scope: !38)
!50 = !DILocation(line: 45, column: 1, scope: !16)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_06_good", scope: !17, file: !17, line: 98, type: !18, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 100, column: 5, scope: !51)
!53 = !DILocation(line: 101, column: 5, scope: !51)
!54 = !DILocation(line: 102, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 114, type: !56, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 114, type: !7)
!62 = !DILocation(line: 114, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 114, type: !58)
!64 = !DILocation(line: 114, column: 27, scope: !55)
!65 = !DILocation(line: 117, column: 22, scope: !55)
!66 = !DILocation(line: 117, column: 12, scope: !55)
!67 = !DILocation(line: 117, column: 5, scope: !55)
!68 = !DILocation(line: 119, column: 5, scope: !55)
!69 = !DILocation(line: 120, column: 5, scope: !55)
!70 = !DILocation(line: 121, column: 5, scope: !55)
!71 = !DILocation(line: 124, column: 5, scope: !55)
!72 = !DILocation(line: 125, column: 5, scope: !55)
!73 = !DILocation(line: 126, column: 5, scope: !55)
!74 = !DILocation(line: 128, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !17, line: 54, type: !4)
!77 = !DILocation(line: 54, column: 15, scope: !75)
!78 = !DILocation(line: 55, column: 23, scope: !75)
!79 = !DILocation(line: 55, column: 12, scope: !75)
!80 = !DILocation(line: 55, column: 10, scope: !75)
!81 = !DILocation(line: 56, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !17, line: 56, column: 9)
!83 = !DILocation(line: 56, column: 14, scope: !82)
!84 = !DILocation(line: 56, column: 9, scope: !75)
!85 = !DILocation(line: 56, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 56, column: 23)
!87 = !DILocation(line: 65, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !17, line: 63, column: 5)
!89 = distinct !DILexicalBlock(scope: !75, file: !17, line: 57, column: 8)
!90 = !DILocation(line: 65, column: 9, scope: !88)
!91 = !DILocation(line: 66, column: 9, scope: !88)
!92 = !DILocation(line: 66, column: 20, scope: !88)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !17, line: 69, type: !39)
!94 = distinct !DILexicalBlock(scope: !75, file: !17, line: 68, column: 5)
!95 = !DILocation(line: 69, column: 17, scope: !94)
!96 = !DILocation(line: 71, column: 16, scope: !94)
!97 = !DILocation(line: 71, column: 22, scope: !94)
!98 = !DILocation(line: 71, column: 9, scope: !94)
!99 = !DILocation(line: 72, column: 20, scope: !94)
!100 = !DILocation(line: 72, column: 9, scope: !94)
!101 = !DILocation(line: 73, column: 14, scope: !94)
!102 = !DILocation(line: 73, column: 9, scope: !94)
!103 = !DILocation(line: 75, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 78, type: !18, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !17, line: 80, type: !4)
!106 = !DILocation(line: 80, column: 15, scope: !104)
!107 = !DILocation(line: 81, column: 23, scope: !104)
!108 = !DILocation(line: 81, column: 12, scope: !104)
!109 = !DILocation(line: 81, column: 10, scope: !104)
!110 = !DILocation(line: 82, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !17, line: 82, column: 9)
!112 = !DILocation(line: 82, column: 14, scope: !111)
!113 = !DILocation(line: 82, column: 9, scope: !104)
!114 = !DILocation(line: 82, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 82, column: 23)
!116 = !DILocation(line: 86, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !17, line: 84, column: 5)
!118 = distinct !DILexicalBlock(scope: !104, file: !17, line: 83, column: 8)
!119 = !DILocation(line: 86, column: 9, scope: !117)
!120 = !DILocation(line: 87, column: 9, scope: !117)
!121 = !DILocation(line: 87, column: 20, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !17, line: 90, type: !39)
!123 = distinct !DILexicalBlock(scope: !104, file: !17, line: 89, column: 5)
!124 = !DILocation(line: 90, column: 17, scope: !123)
!125 = !DILocation(line: 92, column: 16, scope: !123)
!126 = !DILocation(line: 92, column: 22, scope: !123)
!127 = !DILocation(line: 92, column: 9, scope: !123)
!128 = !DILocation(line: 93, column: 20, scope: !123)
!129 = !DILocation(line: 93, column: 9, scope: !123)
!130 = !DILocation(line: 94, column: 14, scope: !123)
!131 = !DILocation(line: 94, column: 9, scope: !123)
!132 = !DILocation(line: 96, column: 1, scope: !104)
