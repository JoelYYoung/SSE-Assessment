; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx2, align 1, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* %3), !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* %4) #7, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !47
  store i8* %call, i8** %data.addr, align 8, !dbg !48
  %0 = load i8*, i8** %data.addr, align 8, !dbg !49
  %cmp = icmp eq i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !55
  store i8 0, i8* %arrayidx, align 1, !dbg !56
  %2 = load i8*, i8** %data.addr, align 8, !dbg !57
  ret i8* %2, !dbg !58
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %call = call i8* @goodG2BSource(i8* %0), !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !91
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %3), !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* %4) #7, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !106
  store i8* %call, i8** %data.addr, align 8, !dbg !107
  %0 = load i8*, i8** %data.addr, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %2 = load i8*, i8** %data.addr, align 8, !dbg !116
  ret i8* %2, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 34, type: !5)
!19 = !DILocation(line: 34, column: 12, scope: !14)
!20 = !DILocation(line: 35, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 22, scope: !14)
!22 = !DILocation(line: 36, column: 12, scope: !14)
!23 = !DILocation(line: 36, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 38, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 38, column: 14, scope: !25)
!30 = !DILocation(line: 39, column: 9, scope: !25)
!31 = !DILocation(line: 40, column: 9, scope: !25)
!32 = !DILocation(line: 40, column: 23, scope: !25)
!33 = !DILocation(line: 42, column: 16, scope: !25)
!34 = !DILocation(line: 42, column: 9, scope: !25)
!35 = !DILocation(line: 43, column: 9, scope: !25)
!36 = !DILocation(line: 43, column: 21, scope: !25)
!37 = !DILocation(line: 44, column: 19, scope: !25)
!38 = !DILocation(line: 44, column: 9, scope: !25)
!39 = !DILocation(line: 45, column: 14, scope: !25)
!40 = !DILocation(line: 45, column: 9, scope: !25)
!41 = !DILocation(line: 47, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !43, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!5, !5}
!45 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !15, line: 23, type: !5)
!46 = !DILocation(line: 23, column: 32, scope: !42)
!47 = !DILocation(line: 26, column: 20, scope: !42)
!48 = !DILocation(line: 26, column: 10, scope: !42)
!49 = !DILocation(line: 27, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !15, line: 27, column: 9)
!51 = !DILocation(line: 27, column: 14, scope: !50)
!52 = !DILocation(line: 27, column: 9, scope: !42)
!53 = !DILocation(line: 27, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 27, column: 23)
!55 = !DILocation(line: 28, column: 5, scope: !42)
!56 = !DILocation(line: 28, column: 13, scope: !42)
!57 = !DILocation(line: 29, column: 12, scope: !42)
!58 = !DILocation(line: 29, column: 5, scope: !42)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_42_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 82, column: 5, scope: !59)
!61 = !DILocation(line: 83, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !63, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !15, line: 95, type: !65)
!68 = !DILocation(line: 95, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !15, line: 95, type: !66)
!70 = !DILocation(line: 95, column: 27, scope: !62)
!71 = !DILocation(line: 98, column: 22, scope: !62)
!72 = !DILocation(line: 98, column: 12, scope: !62)
!73 = !DILocation(line: 98, column: 5, scope: !62)
!74 = !DILocation(line: 100, column: 5, scope: !62)
!75 = !DILocation(line: 101, column: 5, scope: !62)
!76 = !DILocation(line: 102, column: 5, scope: !62)
!77 = !DILocation(line: 105, column: 5, scope: !62)
!78 = !DILocation(line: 106, column: 5, scope: !62)
!79 = !DILocation(line: 107, column: 5, scope: !62)
!80 = !DILocation(line: 109, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 65, type: !5)
!83 = !DILocation(line: 65, column: 12, scope: !81)
!84 = !DILocation(line: 66, column: 10, scope: !81)
!85 = !DILocation(line: 67, column: 26, scope: !81)
!86 = !DILocation(line: 67, column: 12, scope: !81)
!87 = !DILocation(line: 67, column: 10, scope: !81)
!88 = !DILocalVariable(name: "source", scope: !89, file: !15, line: 69, type: !26)
!89 = distinct !DILexicalBlock(scope: !81, file: !15, line: 68, column: 5)
!90 = !DILocation(line: 69, column: 14, scope: !89)
!91 = !DILocation(line: 70, column: 9, scope: !89)
!92 = !DILocation(line: 71, column: 9, scope: !89)
!93 = !DILocation(line: 71, column: 23, scope: !89)
!94 = !DILocation(line: 73, column: 16, scope: !89)
!95 = !DILocation(line: 73, column: 9, scope: !89)
!96 = !DILocation(line: 74, column: 9, scope: !89)
!97 = !DILocation(line: 74, column: 21, scope: !89)
!98 = !DILocation(line: 75, column: 19, scope: !89)
!99 = !DILocation(line: 75, column: 9, scope: !89)
!100 = !DILocation(line: 76, column: 14, scope: !89)
!101 = !DILocation(line: 76, column: 9, scope: !89)
!102 = !DILocation(line: 78, column: 1, scope: !81)
!103 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 53, type: !43, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !15, line: 53, type: !5)
!105 = !DILocation(line: 53, column: 36, scope: !103)
!106 = !DILocation(line: 56, column: 20, scope: !103)
!107 = !DILocation(line: 56, column: 10, scope: !103)
!108 = !DILocation(line: 57, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 57, column: 9)
!110 = !DILocation(line: 57, column: 14, scope: !109)
!111 = !DILocation(line: 57, column: 9, scope: !103)
!112 = !DILocation(line: 57, column: 24, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 57, column: 23)
!114 = !DILocation(line: 58, column: 5, scope: !103)
!115 = !DILocation(line: 58, column: 13, scope: !103)
!116 = !DILocation(line: 59, column: 12, scope: !103)
!117 = !DILocation(line: 59, column: 5, scope: !103)
