; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !26
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %1, null, !dbg !29
  br i1 %cmp, label %if.then1, label %if.end, !dbg !30

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end2, !dbg !35

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !47
  store i8 0, i8* %arrayidx5, align 1, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %5), !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* %6) #7, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %0 = load i32, i32* @globalFalse, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end2, !dbg !86

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %cmp = icmp eq i8* %1, null, !dbg !92
  br i1 %cmp, label %if.then1, label %if.end, !dbg !93

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx3, align 1, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !106
  store i8 0, i8* %arrayidx5, align 1, !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %5), !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !110
  call void @free(i8* %6) #7, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* null, i8** %data, align 8, !dbg !116
  %0 = load i32, i32* @globalTrue, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end2, !dbg !119

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !120
  store i8* %call, i8** %data, align 8, !dbg !122
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %cmp = icmp eq i8* %1, null, !dbg !125
  br i1 %cmp, label %if.then1, label %if.end, !dbg !126

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  br label %if.end2, !dbg !131

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx3, align 1, !dbg !137
  %3 = load i8*, i8** %data, align 8, !dbg !138
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !139
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !139
  %4 = load i8*, i8** %data, align 8, !dbg !140
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !140
  store i8 0, i8* %arrayidx5, align 1, !dbg !141
  %5 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %5), !dbg !143
  %6 = load i8*, i8** %data, align 8, !dbg !144
  call void @free(i8* %6) #7, !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 9, scope: !25)
!34 = !DILocation(line: 32, column: 17, scope: !25)
!35 = !DILocation(line: 33, column: 5, scope: !25)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocation(line: 36, column: 9, scope: !37)
!43 = !DILocation(line: 37, column: 9, scope: !37)
!44 = !DILocation(line: 37, column: 23, scope: !37)
!45 = !DILocation(line: 39, column: 17, scope: !37)
!46 = !DILocation(line: 39, column: 9, scope: !37)
!47 = !DILocation(line: 40, column: 9, scope: !37)
!48 = !DILocation(line: 40, column: 21, scope: !37)
!49 = !DILocation(line: 41, column: 19, scope: !37)
!50 = !DILocation(line: 41, column: 9, scope: !37)
!51 = !DILocation(line: 42, column: 14, scope: !37)
!52 = !DILocation(line: 42, column: 9, scope: !37)
!53 = !DILocation(line: 44, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_10_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 105, column: 5, scope: !54)
!56 = !DILocation(line: 106, column: 5, scope: !54)
!57 = !DILocation(line: 107, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !59, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 119, type: !61)
!64 = !DILocation(line: 119, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 119, type: !62)
!66 = !DILocation(line: 119, column: 27, scope: !58)
!67 = !DILocation(line: 122, column: 22, scope: !58)
!68 = !DILocation(line: 122, column: 12, scope: !58)
!69 = !DILocation(line: 122, column: 5, scope: !58)
!70 = !DILocation(line: 124, column: 5, scope: !58)
!71 = !DILocation(line: 125, column: 5, scope: !58)
!72 = !DILocation(line: 126, column: 5, scope: !58)
!73 = !DILocation(line: 129, column: 5, scope: !58)
!74 = !DILocation(line: 130, column: 5, scope: !58)
!75 = !DILocation(line: 131, column: 5, scope: !58)
!76 = !DILocation(line: 133, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 53, type: !4)
!79 = !DILocation(line: 53, column: 12, scope: !77)
!80 = !DILocation(line: 54, column: 10, scope: !77)
!81 = !DILocation(line: 55, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !15, line: 55, column: 8)
!83 = !DILocation(line: 55, column: 8, scope: !77)
!84 = !DILocation(line: 58, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !15, line: 56, column: 5)
!86 = !DILocation(line: 59, column: 5, scope: !85)
!87 = !DILocation(line: 63, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !15, line: 61, column: 5)
!89 = !DILocation(line: 63, column: 14, scope: !88)
!90 = !DILocation(line: 64, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 13)
!92 = !DILocation(line: 64, column: 18, scope: !91)
!93 = !DILocation(line: 64, column: 13, scope: !88)
!94 = !DILocation(line: 64, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 64, column: 27)
!96 = !DILocation(line: 65, column: 9, scope: !88)
!97 = !DILocation(line: 65, column: 17, scope: !88)
!98 = !DILocalVariable(name: "source", scope: !99, file: !15, line: 68, type: !38)
!99 = distinct !DILexicalBlock(scope: !77, file: !15, line: 67, column: 5)
!100 = !DILocation(line: 68, column: 14, scope: !99)
!101 = !DILocation(line: 69, column: 9, scope: !99)
!102 = !DILocation(line: 70, column: 9, scope: !99)
!103 = !DILocation(line: 70, column: 23, scope: !99)
!104 = !DILocation(line: 72, column: 17, scope: !99)
!105 = !DILocation(line: 72, column: 9, scope: !99)
!106 = !DILocation(line: 73, column: 9, scope: !99)
!107 = !DILocation(line: 73, column: 21, scope: !99)
!108 = !DILocation(line: 74, column: 19, scope: !99)
!109 = !DILocation(line: 74, column: 9, scope: !99)
!110 = !DILocation(line: 75, column: 14, scope: !99)
!111 = !DILocation(line: 75, column: 9, scope: !99)
!112 = !DILocation(line: 77, column: 1, scope: !77)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 82, type: !4)
!115 = !DILocation(line: 82, column: 12, scope: !113)
!116 = !DILocation(line: 83, column: 10, scope: !113)
!117 = !DILocation(line: 84, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 84, column: 8)
!119 = !DILocation(line: 84, column: 8, scope: !113)
!120 = !DILocation(line: 87, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 85, column: 5)
!122 = !DILocation(line: 87, column: 14, scope: !121)
!123 = !DILocation(line: 88, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 88, column: 13)
!125 = !DILocation(line: 88, column: 18, scope: !124)
!126 = !DILocation(line: 88, column: 13, scope: !121)
!127 = !DILocation(line: 88, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 88, column: 27)
!129 = !DILocation(line: 89, column: 9, scope: !121)
!130 = !DILocation(line: 89, column: 17, scope: !121)
!131 = !DILocation(line: 90, column: 5, scope: !121)
!132 = !DILocalVariable(name: "source", scope: !133, file: !15, line: 92, type: !38)
!133 = distinct !DILexicalBlock(scope: !113, file: !15, line: 91, column: 5)
!134 = !DILocation(line: 92, column: 14, scope: !133)
!135 = !DILocation(line: 93, column: 9, scope: !133)
!136 = !DILocation(line: 94, column: 9, scope: !133)
!137 = !DILocation(line: 94, column: 23, scope: !133)
!138 = !DILocation(line: 96, column: 17, scope: !133)
!139 = !DILocation(line: 96, column: 9, scope: !133)
!140 = !DILocation(line: 97, column: 9, scope: !133)
!141 = !DILocation(line: 97, column: 21, scope: !133)
!142 = !DILocation(line: 98, column: 19, scope: !133)
!143 = !DILocation(line: 98, column: 9, scope: !133)
!144 = !DILocation(line: 99, column: 14, scope: !133)
!145 = !DILocation(line: 99, column: 9, scope: !133)
!146 = !DILocation(line: 101, column: 1, scope: !113)
