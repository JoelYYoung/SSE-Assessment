; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx4, align 1, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %call6 = call i8* @strncat(i8* %2, i8* %arraydecay5, i64 100) #6, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %3), !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %4) #6, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end3, !dbg !89

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !90
  store i8* %call1, i8** %data, align 8, !dbg !92
  %0 = load i8*, i8** %data, align 8, !dbg !93
  %cmp = icmp eq i8* %0, null, !dbg !95
  br i1 %cmp, label %if.then2, label %if.end, !dbg !96

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  %call6 = call i8* @strncat(i8* %2, i8* %arraydecay5, i64 100) #6, !dbg !109
  %3 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %3), !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %4) #6, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !115 {
entry:
  ret i32 0, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* null, i8** %data, align 8, !dbg !120
  %call = call i32 @staticReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end3, !dbg !123

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !124
  store i8* %call1, i8** %data, align 8, !dbg !126
  %0 = load i8*, i8** %data, align 8, !dbg !127
  %cmp = icmp eq i8* %0, null, !dbg !129
  br i1 %cmp, label %if.then2, label %if.end, !dbg !130

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !131
  unreachable, !dbg !131

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  br label %if.end3, !dbg !135

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx4, align 1, !dbg !141
  %2 = load i8*, i8** %data, align 8, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !143
  %call6 = call i8* @strncat(i8* %2, i8* %arraydecay5, i64 100) #6, !dbg !144
  %3 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* %3), !dbg !146
  %4 = load i8*, i8** %data, align 8, !dbg !147
  call void @free(i8* %4) #6, !dbg !148
  ret void, !dbg !149
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
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocation(line: 44, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!26 = !DILocation(line: 44, column: 14, scope: !25)
!27 = !DILocation(line: 45, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 13)
!29 = !DILocation(line: 45, column: 18, scope: !28)
!30 = !DILocation(line: 45, column: 13, scope: !25)
!31 = !DILocation(line: 45, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 45, column: 27)
!33 = !DILocation(line: 46, column: 9, scope: !25)
!34 = !DILocation(line: 46, column: 17, scope: !25)
!35 = !DILocation(line: 47, column: 5, scope: !25)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 49, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 49, column: 14, scope: !37)
!42 = !DILocation(line: 50, column: 9, scope: !37)
!43 = !DILocation(line: 51, column: 9, scope: !37)
!44 = !DILocation(line: 51, column: 23, scope: !37)
!45 = !DILocation(line: 53, column: 17, scope: !37)
!46 = !DILocation(line: 53, column: 23, scope: !37)
!47 = !DILocation(line: 53, column: 9, scope: !37)
!48 = !DILocation(line: 54, column: 19, scope: !37)
!49 = !DILocation(line: 54, column: 9, scope: !37)
!50 = !DILocation(line: 55, column: 14, scope: !37)
!51 = !DILocation(line: 55, column: 9, scope: !37)
!52 = !DILocation(line: 57, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_08_good", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 116, column: 5, scope: !53)
!55 = !DILocation(line: 117, column: 5, scope: !53)
!56 = !DILocation(line: 118, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 130, type: !58, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 130, type: !60)
!63 = !DILocation(line: 130, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 130, type: !61)
!65 = !DILocation(line: 130, column: 27, scope: !57)
!66 = !DILocation(line: 133, column: 22, scope: !57)
!67 = !DILocation(line: 133, column: 12, scope: !57)
!68 = !DILocation(line: 133, column: 5, scope: !57)
!69 = !DILocation(line: 135, column: 5, scope: !57)
!70 = !DILocation(line: 136, column: 5, scope: !57)
!71 = !DILocation(line: 137, column: 5, scope: !57)
!72 = !DILocation(line: 140, column: 5, scope: !57)
!73 = !DILocation(line: 141, column: 5, scope: !57)
!74 = !DILocation(line: 142, column: 5, scope: !57)
!75 = !DILocation(line: 144, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !77, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!60}
!79 = !DILocation(line: 27, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 66, type: !4)
!82 = !DILocation(line: 66, column: 12, scope: !80)
!83 = !DILocation(line: 67, column: 10, scope: !80)
!84 = !DILocation(line: 68, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !15, line: 68, column: 8)
!86 = !DILocation(line: 68, column: 8, scope: !80)
!87 = !DILocation(line: 71, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 69, column: 5)
!89 = !DILocation(line: 72, column: 5, scope: !88)
!90 = !DILocation(line: 76, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !15, line: 74, column: 5)
!92 = !DILocation(line: 76, column: 14, scope: !91)
!93 = !DILocation(line: 77, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 77, column: 13)
!95 = !DILocation(line: 77, column: 18, scope: !94)
!96 = !DILocation(line: 77, column: 13, scope: !91)
!97 = !DILocation(line: 77, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 77, column: 27)
!99 = !DILocation(line: 78, column: 9, scope: !91)
!100 = !DILocation(line: 78, column: 17, scope: !91)
!101 = !DILocalVariable(name: "source", scope: !102, file: !15, line: 81, type: !38)
!102 = distinct !DILexicalBlock(scope: !80, file: !15, line: 80, column: 5)
!103 = !DILocation(line: 81, column: 14, scope: !102)
!104 = !DILocation(line: 82, column: 9, scope: !102)
!105 = !DILocation(line: 83, column: 9, scope: !102)
!106 = !DILocation(line: 83, column: 23, scope: !102)
!107 = !DILocation(line: 85, column: 17, scope: !102)
!108 = !DILocation(line: 85, column: 23, scope: !102)
!109 = !DILocation(line: 85, column: 9, scope: !102)
!110 = !DILocation(line: 86, column: 19, scope: !102)
!111 = !DILocation(line: 86, column: 9, scope: !102)
!112 = !DILocation(line: 87, column: 14, scope: !102)
!113 = !DILocation(line: 87, column: 9, scope: !102)
!114 = !DILocation(line: 89, column: 1, scope: !80)
!115 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !77, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 32, column: 5, scope: !115)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 94, type: !4)
!119 = !DILocation(line: 94, column: 12, scope: !117)
!120 = !DILocation(line: 95, column: 10, scope: !117)
!121 = !DILocation(line: 96, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !15, line: 96, column: 8)
!123 = !DILocation(line: 96, column: 8, scope: !117)
!124 = !DILocation(line: 99, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 97, column: 5)
!126 = !DILocation(line: 99, column: 14, scope: !125)
!127 = !DILocation(line: 100, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !15, line: 100, column: 13)
!129 = !DILocation(line: 100, column: 18, scope: !128)
!130 = !DILocation(line: 100, column: 13, scope: !125)
!131 = !DILocation(line: 100, column: 28, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 100, column: 27)
!133 = !DILocation(line: 101, column: 9, scope: !125)
!134 = !DILocation(line: 101, column: 17, scope: !125)
!135 = !DILocation(line: 102, column: 5, scope: !125)
!136 = !DILocalVariable(name: "source", scope: !137, file: !15, line: 104, type: !38)
!137 = distinct !DILexicalBlock(scope: !117, file: !15, line: 103, column: 5)
!138 = !DILocation(line: 104, column: 14, scope: !137)
!139 = !DILocation(line: 105, column: 9, scope: !137)
!140 = !DILocation(line: 106, column: 9, scope: !137)
!141 = !DILocation(line: 106, column: 23, scope: !137)
!142 = !DILocation(line: 108, column: 17, scope: !137)
!143 = !DILocation(line: 108, column: 23, scope: !137)
!144 = !DILocation(line: 108, column: 9, scope: !137)
!145 = !DILocation(line: 109, column: 19, scope: !137)
!146 = !DILocation(line: 109, column: 9, scope: !137)
!147 = !DILocation(line: 110, column: 14, scope: !137)
!148 = !DILocation(line: 110, column: 9, scope: !137)
!149 = !DILocation(line: 112, column: 1, scope: !117)
