; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  %3 = load i32*, i32** %data, align 8, !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call4 = call i32* @wcsncpy(i32* %3, i32* %arraydecay3, i64 99) #5, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !49
  store i32 0, i32* %arrayidx5, align 4, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %5), !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = bitcast i32* %6 to i8*, !dbg !53
  call void @free(i8* %7) #5, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32* null, i32** %data, align 8, !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !84
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !101
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx2, align 4, !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call4 = call i32* @wcsncpy(i32* %3, i32* %arraydecay3, i64 99) #5, !dbg !106
  %4 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !107
  store i32 0, i32* %arrayidx5, align 4, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %5), !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %7 = bitcast i32* %6 to i8*, !dbg !111
  call void @free(i8* %7) #5, !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32* null, i32** %data, align 8, !dbg !117
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !118
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !135
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx2, align 4, !dbg !137
  %3 = load i32*, i32** %data, align 8, !dbg !138
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call4 = call i32* @wcsncpy(i32* %3, i32* %arraydecay3, i64 99) #5, !dbg !140
  %4 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !141
  store i32 0, i32* %arrayidx5, align 4, !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %5), !dbg !144
  %6 = load i32*, i32** %data, align 8, !dbg !145
  %7 = bitcast i32* %6 to i8*, !dbg !145
  call void @free(i8* %7) #5, !dbg !146
  ret void, !dbg !147
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 30, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 28, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!26 = !DILocation(line: 30, column: 16, scope: !24)
!27 = !DILocation(line: 30, column: 14, scope: !24)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !24)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 9, scope: !24)
!35 = !DILocation(line: 32, column: 17, scope: !24)
!36 = !DILocalVariable(name: "source", scope: !37, file: !17, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 35, column: 17, scope: !37)
!42 = !DILocation(line: 36, column: 17, scope: !37)
!43 = !DILocation(line: 36, column: 9, scope: !37)
!44 = !DILocation(line: 37, column: 9, scope: !37)
!45 = !DILocation(line: 37, column: 23, scope: !37)
!46 = !DILocation(line: 39, column: 17, scope: !37)
!47 = !DILocation(line: 39, column: 23, scope: !37)
!48 = !DILocation(line: 39, column: 9, scope: !37)
!49 = !DILocation(line: 40, column: 9, scope: !37)
!50 = !DILocation(line: 40, column: 21, scope: !37)
!51 = !DILocation(line: 41, column: 20, scope: !37)
!52 = !DILocation(line: 41, column: 9, scope: !37)
!53 = !DILocation(line: 42, column: 14, scope: !37)
!54 = !DILocation(line: 42, column: 9, scope: !37)
!55 = !DILocation(line: 44, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_03_good", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 105, column: 5, scope: !56)
!58 = !DILocation(line: 106, column: 5, scope: !56)
!59 = !DILocation(line: 107, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 119, type: !61, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !17, line: 119, type: !7)
!67 = !DILocation(line: 119, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !17, line: 119, type: !63)
!69 = !DILocation(line: 119, column: 27, scope: !60)
!70 = !DILocation(line: 122, column: 22, scope: !60)
!71 = !DILocation(line: 122, column: 12, scope: !60)
!72 = !DILocation(line: 122, column: 5, scope: !60)
!73 = !DILocation(line: 124, column: 5, scope: !60)
!74 = !DILocation(line: 125, column: 5, scope: !60)
!75 = !DILocation(line: 126, column: 5, scope: !60)
!76 = !DILocation(line: 129, column: 5, scope: !60)
!77 = !DILocation(line: 130, column: 5, scope: !60)
!78 = !DILocation(line: 131, column: 5, scope: !60)
!79 = !DILocation(line: 133, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !17, line: 53, type: !4)
!82 = !DILocation(line: 53, column: 15, scope: !80)
!83 = !DILocation(line: 54, column: 10, scope: !80)
!84 = !DILocation(line: 63, column: 27, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !17, line: 61, column: 5)
!86 = distinct !DILexicalBlock(scope: !80, file: !17, line: 55, column: 8)
!87 = !DILocation(line: 63, column: 16, scope: !85)
!88 = !DILocation(line: 63, column: 14, scope: !85)
!89 = !DILocation(line: 64, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !17, line: 64, column: 13)
!91 = !DILocation(line: 64, column: 18, scope: !90)
!92 = !DILocation(line: 64, column: 13, scope: !85)
!93 = !DILocation(line: 64, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 64, column: 27)
!95 = !DILocation(line: 65, column: 9, scope: !85)
!96 = !DILocation(line: 65, column: 17, scope: !85)
!97 = !DILocalVariable(name: "source", scope: !98, file: !17, line: 68, type: !38)
!98 = distinct !DILexicalBlock(scope: !80, file: !17, line: 67, column: 5)
!99 = !DILocation(line: 68, column: 17, scope: !98)
!100 = !DILocation(line: 69, column: 17, scope: !98)
!101 = !DILocation(line: 69, column: 9, scope: !98)
!102 = !DILocation(line: 70, column: 9, scope: !98)
!103 = !DILocation(line: 70, column: 23, scope: !98)
!104 = !DILocation(line: 72, column: 17, scope: !98)
!105 = !DILocation(line: 72, column: 23, scope: !98)
!106 = !DILocation(line: 72, column: 9, scope: !98)
!107 = !DILocation(line: 73, column: 9, scope: !98)
!108 = !DILocation(line: 73, column: 21, scope: !98)
!109 = !DILocation(line: 74, column: 20, scope: !98)
!110 = !DILocation(line: 74, column: 9, scope: !98)
!111 = !DILocation(line: 75, column: 14, scope: !98)
!112 = !DILocation(line: 75, column: 9, scope: !98)
!113 = !DILocation(line: 77, column: 1, scope: !80)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !17, line: 82, type: !4)
!116 = !DILocation(line: 82, column: 15, scope: !114)
!117 = !DILocation(line: 83, column: 10, scope: !114)
!118 = !DILocation(line: 87, column: 27, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !17, line: 85, column: 5)
!120 = distinct !DILexicalBlock(scope: !114, file: !17, line: 84, column: 8)
!121 = !DILocation(line: 87, column: 16, scope: !119)
!122 = !DILocation(line: 87, column: 14, scope: !119)
!123 = !DILocation(line: 88, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !17, line: 88, column: 13)
!125 = !DILocation(line: 88, column: 18, scope: !124)
!126 = !DILocation(line: 88, column: 13, scope: !119)
!127 = !DILocation(line: 88, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 88, column: 27)
!129 = !DILocation(line: 89, column: 9, scope: !119)
!130 = !DILocation(line: 89, column: 17, scope: !119)
!131 = !DILocalVariable(name: "source", scope: !132, file: !17, line: 92, type: !38)
!132 = distinct !DILexicalBlock(scope: !114, file: !17, line: 91, column: 5)
!133 = !DILocation(line: 92, column: 17, scope: !132)
!134 = !DILocation(line: 93, column: 17, scope: !132)
!135 = !DILocation(line: 93, column: 9, scope: !132)
!136 = !DILocation(line: 94, column: 9, scope: !132)
!137 = !DILocation(line: 94, column: 23, scope: !132)
!138 = !DILocation(line: 96, column: 17, scope: !132)
!139 = !DILocation(line: 96, column: 23, scope: !132)
!140 = !DILocation(line: 96, column: 9, scope: !132)
!141 = !DILocation(line: 97, column: 9, scope: !132)
!142 = !DILocation(line: 97, column: 21, scope: !132)
!143 = !DILocation(line: 98, column: 20, scope: !132)
!144 = !DILocation(line: 98, column: 9, scope: !132)
!145 = !DILocation(line: 99, column: 14, scope: !132)
!146 = !DILocation(line: 99, column: 9, scope: !132)
!147 = !DILocation(line: 101, column: 1, scope: !114)
