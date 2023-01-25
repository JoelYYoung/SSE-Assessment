; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42_bad() #0 !dbg !14 {
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
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %call1 = call i8* @badSource(i8* %1), !dbg !29
  store i8* %call1, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %call2 = call i8* @strcat(i8* %arraydecay, i8* %3) #6, !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %4), !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !42
  call void @free(i8* %5) #6, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !51
  %1 = load i8*, i8** %data.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %2 = load i8*, i8** %data.addr, align 8, !dbg !54
  ret i8* %2, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42_good() #0 !dbg !56 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42_bad(), !dbg !75
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
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %call1 = call i8* @goodG2BSource(i8* %1), !dbg !90
  store i8* %call1, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %call2 = call i8* @strcat(i8* %arraydecay, i8* %3) #6, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %4), !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* %5) #6, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i8*, i8** %data.addr, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !107
  %1 = load i8*, i8** %data.addr, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %2 = load i8*, i8** %data.addr, align 8, !dbg !110
  ret i8* %2, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42_bad", scope: !15, file: !15, line: 31, type: !16, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 33, type: !4)
!19 = !DILocation(line: 33, column: 12, scope: !14)
!20 = !DILocation(line: 34, column: 20, scope: !14)
!21 = !DILocation(line: 34, column: 10, scope: !14)
!22 = !DILocation(line: 35, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 9)
!24 = !DILocation(line: 35, column: 14, scope: !23)
!25 = !DILocation(line: 35, column: 9, scope: !14)
!26 = !DILocation(line: 35, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 23)
!28 = !DILocation(line: 36, column: 22, scope: !14)
!29 = !DILocation(line: 36, column: 12, scope: !14)
!30 = !DILocation(line: 36, column: 10, scope: !14)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !15, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 38, column: 14, scope: !32)
!37 = !DILocation(line: 40, column: 16, scope: !32)
!38 = !DILocation(line: 40, column: 22, scope: !32)
!39 = !DILocation(line: 40, column: 9, scope: !32)
!40 = !DILocation(line: 41, column: 19, scope: !32)
!41 = !DILocation(line: 41, column: 9, scope: !32)
!42 = !DILocation(line: 42, column: 14, scope: !32)
!43 = !DILocation(line: 42, column: 9, scope: !32)
!44 = !DILocation(line: 44, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !46, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!4, !4}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !15, line: 23, type: !4)
!49 = !DILocation(line: 23, column: 32, scope: !45)
!50 = !DILocation(line: 26, column: 12, scope: !45)
!51 = !DILocation(line: 26, column: 5, scope: !45)
!52 = !DILocation(line: 27, column: 5, scope: !45)
!53 = !DILocation(line: 27, column: 17, scope: !45)
!54 = !DILocation(line: 28, column: 12, scope: !45)
!55 = !DILocation(line: 28, column: 5, scope: !45)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_42_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 76, column: 5, scope: !56)
!58 = !DILocation(line: 77, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 89, type: !60, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 89, type: !62)
!65 = !DILocation(line: 89, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 89, type: !63)
!67 = !DILocation(line: 89, column: 27, scope: !59)
!68 = !DILocation(line: 92, column: 22, scope: !59)
!69 = !DILocation(line: 92, column: 12, scope: !59)
!70 = !DILocation(line: 92, column: 5, scope: !59)
!71 = !DILocation(line: 94, column: 5, scope: !59)
!72 = !DILocation(line: 95, column: 5, scope: !59)
!73 = !DILocation(line: 96, column: 5, scope: !59)
!74 = !DILocation(line: 99, column: 5, scope: !59)
!75 = !DILocation(line: 100, column: 5, scope: !59)
!76 = !DILocation(line: 101, column: 5, scope: !59)
!77 = !DILocation(line: 103, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 61, type: !4)
!80 = !DILocation(line: 61, column: 12, scope: !78)
!81 = !DILocation(line: 62, column: 20, scope: !78)
!82 = !DILocation(line: 62, column: 10, scope: !78)
!83 = !DILocation(line: 63, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !15, line: 63, column: 9)
!85 = !DILocation(line: 63, column: 14, scope: !84)
!86 = !DILocation(line: 63, column: 9, scope: !78)
!87 = !DILocation(line: 63, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 63, column: 23)
!89 = !DILocation(line: 64, column: 26, scope: !78)
!90 = !DILocation(line: 64, column: 12, scope: !78)
!91 = !DILocation(line: 64, column: 10, scope: !78)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !15, line: 66, type: !33)
!93 = distinct !DILexicalBlock(scope: !78, file: !15, line: 65, column: 5)
!94 = !DILocation(line: 66, column: 14, scope: !93)
!95 = !DILocation(line: 68, column: 16, scope: !93)
!96 = !DILocation(line: 68, column: 22, scope: !93)
!97 = !DILocation(line: 68, column: 9, scope: !93)
!98 = !DILocation(line: 69, column: 19, scope: !93)
!99 = !DILocation(line: 69, column: 9, scope: !93)
!100 = !DILocation(line: 70, column: 14, scope: !93)
!101 = !DILocation(line: 70, column: 9, scope: !93)
!102 = !DILocation(line: 72, column: 1, scope: !78)
!103 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 50, type: !46, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !15, line: 50, type: !4)
!105 = !DILocation(line: 50, column: 36, scope: !103)
!106 = !DILocation(line: 53, column: 12, scope: !103)
!107 = !DILocation(line: 53, column: 5, scope: !103)
!108 = !DILocation(line: 54, column: 5, scope: !103)
!109 = !DILocation(line: 54, column: 16, scope: !103)
!110 = !DILocation(line: 55, column: 12, scope: !103)
!111 = !DILocation(line: 55, column: 5, scope: !103)
