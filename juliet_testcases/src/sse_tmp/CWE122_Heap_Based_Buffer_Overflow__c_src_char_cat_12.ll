; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool = icmp ne i32 %call1, 0, !dbg !28
  br i1 %tobool, label %if.then2, label %if.else, !dbg !30

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end4, !dbg !36

if.else:                                          ; preds = %if.end
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 49, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  %call5 = call i8* @strcat(i8* %arraydecay, i8* %6) #6, !dbg !50
  %7 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %7), !dbg !52
  %8 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %8) #6, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrueOrFalse(...) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
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
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !89
  %tobool = icmp ne i32 %call1, 0, !dbg !89
  br i1 %tobool, label %if.then2, label %if.else, !dbg !91

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end4, !dbg !97

if.else:                                          ; preds = %if.end
  %3 = load i8*, i8** %data, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 49, !dbg !101
  store i8 0, i8* %arrayidx3, align 1, !dbg !102
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  %call5 = call i8* @strcat(i8* %arraydecay, i8* %6) #6, !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %7), !dbg !110
  %8 = load i8*, i8** %data, align 8, !dbg !111
  call void @free(i8* %8) #6, !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 8, scope: !14)
!31 = !DILocation(line: 31, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!39 = !DILocation(line: 37, column: 9, scope: !38)
!40 = !DILocation(line: 38, column: 9, scope: !38)
!41 = !DILocation(line: 38, column: 20, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !15, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 14, scope: !43)
!48 = !DILocation(line: 43, column: 16, scope: !43)
!49 = !DILocation(line: 43, column: 22, scope: !43)
!50 = !DILocation(line: 43, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 19, scope: !43)
!52 = !DILocation(line: 44, column: 9, scope: !43)
!53 = !DILocation(line: 45, column: 14, scope: !43)
!54 = !DILocation(line: 45, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_12_good", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 83, column: 5, scope: !56)
!58 = !DILocation(line: 84, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !60, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 96, type: !62)
!65 = !DILocation(line: 96, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 96, type: !63)
!67 = !DILocation(line: 96, column: 27, scope: !59)
!68 = !DILocation(line: 99, column: 22, scope: !59)
!69 = !DILocation(line: 99, column: 12, scope: !59)
!70 = !DILocation(line: 99, column: 5, scope: !59)
!71 = !DILocation(line: 101, column: 5, scope: !59)
!72 = !DILocation(line: 102, column: 5, scope: !59)
!73 = !DILocation(line: 103, column: 5, scope: !59)
!74 = !DILocation(line: 106, column: 5, scope: !59)
!75 = !DILocation(line: 107, column: 5, scope: !59)
!76 = !DILocation(line: 108, column: 5, scope: !59)
!77 = !DILocation(line: 110, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 57, type: !4)
!80 = !DILocation(line: 57, column: 12, scope: !78)
!81 = !DILocation(line: 58, column: 20, scope: !78)
!82 = !DILocation(line: 58, column: 10, scope: !78)
!83 = !DILocation(line: 59, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !15, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 14, scope: !84)
!86 = !DILocation(line: 59, column: 9, scope: !78)
!87 = !DILocation(line: 59, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 59, column: 23)
!89 = !DILocation(line: 60, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !15, line: 60, column: 8)
!91 = !DILocation(line: 60, column: 8, scope: !78)
!92 = !DILocation(line: 63, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 9, scope: !93)
!95 = !DILocation(line: 64, column: 9, scope: !93)
!96 = !DILocation(line: 64, column: 20, scope: !93)
!97 = !DILocation(line: 65, column: 5, scope: !93)
!98 = !DILocation(line: 69, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !90, file: !15, line: 67, column: 5)
!100 = !DILocation(line: 69, column: 9, scope: !99)
!101 = !DILocation(line: 70, column: 9, scope: !99)
!102 = !DILocation(line: 70, column: 20, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !15, line: 73, type: !44)
!104 = distinct !DILexicalBlock(scope: !78, file: !15, line: 72, column: 5)
!105 = !DILocation(line: 73, column: 14, scope: !104)
!106 = !DILocation(line: 75, column: 16, scope: !104)
!107 = !DILocation(line: 75, column: 22, scope: !104)
!108 = !DILocation(line: 75, column: 9, scope: !104)
!109 = !DILocation(line: 76, column: 19, scope: !104)
!110 = !DILocation(line: 76, column: 9, scope: !104)
!111 = !DILocation(line: 77, column: 14, scope: !104)
!112 = !DILocation(line: 77, column: 9, scope: !104)
!113 = !DILocation(line: 79, column: 1, scope: !78)
