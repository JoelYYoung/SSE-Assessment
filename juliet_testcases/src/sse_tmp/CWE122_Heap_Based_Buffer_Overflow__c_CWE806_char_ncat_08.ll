; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08_bad() #0 !dbg !14 {
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
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !46
  %call5 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call4) #7, !dbg !47
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx6, align 1, !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %6), !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  call void @free(i8* %7) #7, !dbg !53
  ret void, !dbg !54
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !78 {
entry:
  ret i32 1, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !93
  %tobool = icmp ne i32 %call1, 0, !dbg !93
  br i1 %tobool, label %if.then2, label %if.else, !dbg !95

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end3, !dbg !98

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !110
  %call5 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call4) #7, !dbg !111
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !112
  store i8 0, i8* %arrayidx6, align 1, !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %6), !dbg !115
  %7 = load i8*, i8** %data, align 8, !dbg !116
  call void @free(i8* %7) #7, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !119 {
entry:
  ret i32 0, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !124
  store i8* %call, i8** %data, align 8, !dbg !125
  %0 = load i8*, i8** %data, align 8, !dbg !126
  %cmp = icmp eq i8* %0, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !132
  %tobool = icmp ne i32 %call1, 0, !dbg !132
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !134

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !137
  %2 = load i8*, i8** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !138
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  br label %if.end3, !dbg !140

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !143
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !144
  %4 = load i8*, i8** %data, align 8, !dbg !145
  %5 = load i8*, i8** %data, align 8, !dbg !146
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !147
  %call5 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call4) #7, !dbg !148
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !149
  store i8 0, i8* %arrayidx6, align 1, !dbg !150
  %6 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %6), !dbg !152
  %7 = load i8*, i8** %data, align 8, !dbg !153
  call void @free(i8* %7) #7, !dbg !154
  ret void, !dbg !155
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 20, scope: !14)
!21 = !DILocation(line: 40, column: 10, scope: !14)
!22 = !DILocation(line: 41, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!24 = !DILocation(line: 41, column: 14, scope: !23)
!25 = !DILocation(line: 41, column: 9, scope: !14)
!26 = !DILocation(line: 41, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 41, column: 23)
!28 = !DILocation(line: 42, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!30 = !DILocation(line: 42, column: 8, scope: !14)
!31 = !DILocation(line: 45, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 43, column: 5)
!33 = !DILocation(line: 45, column: 9, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !32)
!35 = !DILocation(line: 46, column: 21, scope: !32)
!36 = !DILocation(line: 47, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 14, scope: !38)
!43 = !DILocation(line: 51, column: 17, scope: !38)
!44 = !DILocation(line: 51, column: 23, scope: !38)
!45 = !DILocation(line: 51, column: 36, scope: !38)
!46 = !DILocation(line: 51, column: 29, scope: !38)
!47 = !DILocation(line: 51, column: 9, scope: !38)
!48 = !DILocation(line: 52, column: 9, scope: !38)
!49 = !DILocation(line: 52, column: 20, scope: !38)
!50 = !DILocation(line: 53, column: 19, scope: !38)
!51 = !DILocation(line: 53, column: 9, scope: !38)
!52 = !DILocation(line: 54, column: 14, scope: !38)
!53 = !DILocation(line: 54, column: 9, scope: !38)
!54 = !DILocation(line: 56, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_08_good", scope: !15, file: !15, line: 111, type: !16, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 113, column: 5, scope: !55)
!57 = !DILocation(line: 114, column: 5, scope: !55)
!58 = !DILocation(line: 115, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 127, type: !60, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 127, type: !62)
!65 = !DILocation(line: 127, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 127, type: !63)
!67 = !DILocation(line: 127, column: 27, scope: !59)
!68 = !DILocation(line: 130, column: 22, scope: !59)
!69 = !DILocation(line: 130, column: 12, scope: !59)
!70 = !DILocation(line: 130, column: 5, scope: !59)
!71 = !DILocation(line: 132, column: 5, scope: !59)
!72 = !DILocation(line: 133, column: 5, scope: !59)
!73 = !DILocation(line: 134, column: 5, scope: !59)
!74 = !DILocation(line: 137, column: 5, scope: !59)
!75 = !DILocation(line: 138, column: 5, scope: !59)
!76 = !DILocation(line: 139, column: 5, scope: !59)
!77 = !DILocation(line: 141, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !79, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!62}
!81 = !DILocation(line: 27, column: 5, scope: !78)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 65, type: !4)
!84 = !DILocation(line: 65, column: 12, scope: !82)
!85 = !DILocation(line: 66, column: 20, scope: !82)
!86 = !DILocation(line: 66, column: 10, scope: !82)
!87 = !DILocation(line: 67, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !15, line: 67, column: 9)
!89 = !DILocation(line: 67, column: 14, scope: !88)
!90 = !DILocation(line: 67, column: 9, scope: !82)
!91 = !DILocation(line: 67, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 67, column: 23)
!93 = !DILocation(line: 68, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !15, line: 68, column: 8)
!95 = !DILocation(line: 68, column: 8, scope: !82)
!96 = !DILocation(line: 71, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !15, line: 69, column: 5)
!98 = !DILocation(line: 72, column: 5, scope: !97)
!99 = !DILocation(line: 76, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !15, line: 74, column: 5)
!101 = !DILocation(line: 76, column: 9, scope: !100)
!102 = !DILocation(line: 77, column: 9, scope: !100)
!103 = !DILocation(line: 77, column: 20, scope: !100)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !15, line: 80, type: !39)
!105 = distinct !DILexicalBlock(scope: !82, file: !15, line: 79, column: 5)
!106 = !DILocation(line: 80, column: 14, scope: !105)
!107 = !DILocation(line: 82, column: 17, scope: !105)
!108 = !DILocation(line: 82, column: 23, scope: !105)
!109 = !DILocation(line: 82, column: 36, scope: !105)
!110 = !DILocation(line: 82, column: 29, scope: !105)
!111 = !DILocation(line: 82, column: 9, scope: !105)
!112 = !DILocation(line: 83, column: 9, scope: !105)
!113 = !DILocation(line: 83, column: 20, scope: !105)
!114 = !DILocation(line: 84, column: 19, scope: !105)
!115 = !DILocation(line: 84, column: 9, scope: !105)
!116 = !DILocation(line: 85, column: 14, scope: !105)
!117 = !DILocation(line: 85, column: 9, scope: !105)
!118 = !DILocation(line: 87, column: 1, scope: !82)
!119 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !79, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 32, column: 5, scope: !119)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 92, type: !4)
!123 = !DILocation(line: 92, column: 12, scope: !121)
!124 = !DILocation(line: 93, column: 20, scope: !121)
!125 = !DILocation(line: 93, column: 10, scope: !121)
!126 = !DILocation(line: 94, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !121, file: !15, line: 94, column: 9)
!128 = !DILocation(line: 94, column: 14, scope: !127)
!129 = !DILocation(line: 94, column: 9, scope: !121)
!130 = !DILocation(line: 94, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 94, column: 23)
!132 = !DILocation(line: 95, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !15, line: 95, column: 8)
!134 = !DILocation(line: 95, column: 8, scope: !121)
!135 = !DILocation(line: 98, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 96, column: 5)
!137 = !DILocation(line: 98, column: 9, scope: !136)
!138 = !DILocation(line: 99, column: 9, scope: !136)
!139 = !DILocation(line: 99, column: 20, scope: !136)
!140 = !DILocation(line: 100, column: 5, scope: !136)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !15, line: 102, type: !39)
!142 = distinct !DILexicalBlock(scope: !121, file: !15, line: 101, column: 5)
!143 = !DILocation(line: 102, column: 14, scope: !142)
!144 = !DILocation(line: 104, column: 17, scope: !142)
!145 = !DILocation(line: 104, column: 23, scope: !142)
!146 = !DILocation(line: 104, column: 36, scope: !142)
!147 = !DILocation(line: 104, column: 29, scope: !142)
!148 = !DILocation(line: 104, column: 9, scope: !142)
!149 = !DILocation(line: 105, column: 9, scope: !142)
!150 = !DILocation(line: 105, column: 20, scope: !142)
!151 = !DILocation(line: 106, column: 19, scope: !142)
!152 = !DILocation(line: 106, column: 9, scope: !142)
!153 = !DILocation(line: 107, column: 14, scope: !142)
!154 = !DILocation(line: 107, column: 9, scope: !142)
!155 = !DILocation(line: 109, column: 1, scope: !121)
