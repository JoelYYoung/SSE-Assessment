; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call1, 0, !dbg !28
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !30

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %6), !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %7) #7, !dbg !51
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
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08_good() #0 !dbg !53 {
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
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
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
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %cmp = icmp eq i8* %0, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !91
  %tobool = icmp ne i32 %call1, 0, !dbg !91
  br i1 %tobool, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %6), !dbg !111
  %7 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %7) #7, !dbg !113
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
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !120
  store i8* %call, i8** %data, align 8, !dbg !121
  %0 = load i8*, i8** %data, align 8, !dbg !122
  %cmp = icmp eq i8* %0, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call1, 0, !dbg !128
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !130

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !133
  %2 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  br label %if.end3, !dbg !136

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !139
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !140
  %4 = load i8*, i8** %data, align 8, !dbg !141
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !142
  %5 = load i8*, i8** %data, align 8, !dbg !143
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !144
  %6 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* %6), !dbg !146
  %7 = load i8*, i8** %data, align 8, !dbg !147
  call void @free(i8* %7) #7, !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08_bad", scope: !15, file: !15, line: 43, type: !16, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 45, type: !4)
!19 = !DILocation(line: 45, column: 12, scope: !14)
!20 = !DILocation(line: 46, column: 20, scope: !14)
!21 = !DILocation(line: 46, column: 10, scope: !14)
!22 = !DILocation(line: 47, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 47, column: 9)
!24 = !DILocation(line: 47, column: 14, scope: !23)
!25 = !DILocation(line: 47, column: 9, scope: !14)
!26 = !DILocation(line: 47, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 47, column: 23)
!28 = !DILocation(line: 48, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 8)
!30 = !DILocation(line: 48, column: 8, scope: !14)
!31 = !DILocation(line: 51, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 49, column: 5)
!33 = !DILocation(line: 51, column: 9, scope: !32)
!34 = !DILocation(line: 52, column: 9, scope: !32)
!35 = !DILocation(line: 52, column: 21, scope: !32)
!36 = !DILocation(line: 53, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 55, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 54, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 55, column: 14, scope: !38)
!43 = !DILocation(line: 57, column: 18, scope: !38)
!44 = !DILocation(line: 57, column: 31, scope: !38)
!45 = !DILocation(line: 57, column: 24, scope: !38)
!46 = !DILocation(line: 57, column: 44, scope: !38)
!47 = !DILocation(line: 57, column: 9, scope: !38)
!48 = !DILocation(line: 58, column: 19, scope: !38)
!49 = !DILocation(line: 58, column: 9, scope: !38)
!50 = !DILocation(line: 59, column: 14, scope: !38)
!51 = !DILocation(line: 59, column: 9, scope: !38)
!52 = !DILocation(line: 61, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_08_good", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 31, type: !77, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!60}
!79 = !DILocation(line: 33, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 70, type: !4)
!82 = !DILocation(line: 70, column: 12, scope: !80)
!83 = !DILocation(line: 71, column: 20, scope: !80)
!84 = !DILocation(line: 71, column: 10, scope: !80)
!85 = !DILocation(line: 72, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !15, line: 72, column: 9)
!87 = !DILocation(line: 72, column: 14, scope: !86)
!88 = !DILocation(line: 72, column: 9, scope: !80)
!89 = !DILocation(line: 72, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 72, column: 23)
!91 = !DILocation(line: 73, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !80, file: !15, line: 73, column: 8)
!93 = !DILocation(line: 73, column: 8, scope: !80)
!94 = !DILocation(line: 76, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 74, column: 5)
!96 = !DILocation(line: 77, column: 5, scope: !95)
!97 = !DILocation(line: 81, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !15, line: 79, column: 5)
!99 = !DILocation(line: 81, column: 9, scope: !98)
!100 = !DILocation(line: 82, column: 9, scope: !98)
!101 = !DILocation(line: 82, column: 20, scope: !98)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !15, line: 85, type: !39)
!103 = distinct !DILexicalBlock(scope: !80, file: !15, line: 84, column: 5)
!104 = !DILocation(line: 85, column: 14, scope: !103)
!105 = !DILocation(line: 87, column: 18, scope: !103)
!106 = !DILocation(line: 87, column: 31, scope: !103)
!107 = !DILocation(line: 87, column: 24, scope: !103)
!108 = !DILocation(line: 87, column: 44, scope: !103)
!109 = !DILocation(line: 87, column: 9, scope: !103)
!110 = !DILocation(line: 88, column: 19, scope: !103)
!111 = !DILocation(line: 88, column: 9, scope: !103)
!112 = !DILocation(line: 89, column: 14, scope: !103)
!113 = !DILocation(line: 89, column: 9, scope: !103)
!114 = !DILocation(line: 91, column: 1, scope: !80)
!115 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 36, type: !77, scopeLine: 37, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 38, column: 5, scope: !115)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 96, type: !4)
!119 = !DILocation(line: 96, column: 12, scope: !117)
!120 = !DILocation(line: 97, column: 20, scope: !117)
!121 = !DILocation(line: 97, column: 10, scope: !117)
!122 = !DILocation(line: 98, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !15, line: 98, column: 9)
!124 = !DILocation(line: 98, column: 14, scope: !123)
!125 = !DILocation(line: 98, column: 9, scope: !117)
!126 = !DILocation(line: 98, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 98, column: 23)
!128 = !DILocation(line: 99, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !15, line: 99, column: 8)
!130 = !DILocation(line: 99, column: 8, scope: !117)
!131 = !DILocation(line: 102, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 100, column: 5)
!133 = !DILocation(line: 102, column: 9, scope: !132)
!134 = !DILocation(line: 103, column: 9, scope: !132)
!135 = !DILocation(line: 103, column: 20, scope: !132)
!136 = !DILocation(line: 104, column: 5, scope: !132)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !15, line: 106, type: !39)
!138 = distinct !DILexicalBlock(scope: !117, file: !15, line: 105, column: 5)
!139 = !DILocation(line: 106, column: 14, scope: !138)
!140 = !DILocation(line: 108, column: 18, scope: !138)
!141 = !DILocation(line: 108, column: 31, scope: !138)
!142 = !DILocation(line: 108, column: 24, scope: !138)
!143 = !DILocation(line: 108, column: 44, scope: !138)
!144 = !DILocation(line: 108, column: 9, scope: !138)
!145 = !DILocation(line: 109, column: 19, scope: !138)
!146 = !DILocation(line: 109, column: 9, scope: !138)
!147 = !DILocation(line: 110, column: 14, scope: !138)
!148 = !DILocation(line: 110, column: 9, scope: !138)
!149 = !DILocation(line: 112, column: 1, scope: !117)
