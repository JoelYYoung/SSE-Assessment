; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  %call = call i8* @strcat(i8* %0, i8* %arraydecay1) #6, !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @printLine(i8* %1), !dbg !33
  %2 = load i8*, i8** %data.addr, align 8, !dbg !34
  call void @free(i8* %2) #6, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !40, metadata !DIExpression()), !dbg !41
  store i8* null, i8** %data, align 8, !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !43
  store i8* %call, i8** %data, align 8, !dbg !44
  %0 = load i8*, i8** %data, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %2 = load i8*, i8** %data, align 8, !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_badSink(i8* %2), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_goodG2BSink(i8* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !59, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !62
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  %0 = load i8*, i8** %data.addr, align 8, !dbg !65
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !66
  %call = call i8* @strcat(i8* %0, i8* %arraydecay1) #6, !dbg !67
  %1 = load i8*, i8** %data.addr, align 8, !dbg !68
  call void @printLine(i8* %1), !dbg !69
  %2 = load i8*, i8** %data.addr, align 8, !dbg !70
  call void @free(i8* %2) #6, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i8* null, i8** %data, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !99
  store i8* %call, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %cmp = icmp eq i8* %0, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %2 = load i8*, i8** %data, align 8, !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_goodG2BSink(i8* %2), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 75, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 16, scope: !21)
!30 = !DILocation(line: 30, column: 22, scope: !21)
!31 = !DILocation(line: 30, column: 9, scope: !21)
!32 = !DILocation(line: 31, column: 19, scope: !21)
!33 = !DILocation(line: 31, column: 9, scope: !21)
!34 = !DILocation(line: 32, column: 14, scope: !21)
!35 = !DILocation(line: 32, column: 9, scope: !21)
!36 = !DILocation(line: 34, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_bad", scope: !15, file: !15, line: 36, type: !38, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !15, line: 38, type: !4)
!41 = !DILocation(line: 38, column: 12, scope: !37)
!42 = !DILocation(line: 39, column: 10, scope: !37)
!43 = !DILocation(line: 41, column: 20, scope: !37)
!44 = !DILocation(line: 41, column: 10, scope: !37)
!45 = !DILocation(line: 42, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !15, line: 42, column: 9)
!47 = !DILocation(line: 42, column: 14, scope: !46)
!48 = !DILocation(line: 42, column: 9, scope: !37)
!49 = !DILocation(line: 42, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 42, column: 23)
!51 = !DILocation(line: 43, column: 5, scope: !37)
!52 = !DILocation(line: 43, column: 13, scope: !37)
!53 = !DILocation(line: 44, column: 67, scope: !37)
!54 = !DILocation(line: 44, column: 5, scope: !37)
!55 = !DILocation(line: 45, column: 1, scope: !37)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_goodG2BSink", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !15, line: 51, type: !4)
!58 = !DILocation(line: 51, column: 79, scope: !56)
!59 = !DILocalVariable(name: "source", scope: !60, file: !15, line: 54, type: !22)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 53, column: 5)
!61 = !DILocation(line: 54, column: 14, scope: !60)
!62 = !DILocation(line: 55, column: 9, scope: !60)
!63 = !DILocation(line: 56, column: 9, scope: !60)
!64 = !DILocation(line: 56, column: 23, scope: !60)
!65 = !DILocation(line: 58, column: 16, scope: !60)
!66 = !DILocation(line: 58, column: 22, scope: !60)
!67 = !DILocation(line: 58, column: 9, scope: !60)
!68 = !DILocation(line: 59, column: 19, scope: !60)
!69 = !DILocation(line: 59, column: 9, scope: !60)
!70 = !DILocation(line: 60, column: 14, scope: !60)
!71 = !DILocation(line: 60, column: 9, scope: !60)
!72 = !DILocation(line: 62, column: 1, scope: !56)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_41_good", scope: !15, file: !15, line: 76, type: !38, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 78, column: 5, scope: !73)
!75 = !DILocation(line: 79, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !77, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !15, line: 91, type: !79)
!82 = !DILocation(line: 91, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !15, line: 91, type: !80)
!84 = !DILocation(line: 91, column: 27, scope: !76)
!85 = !DILocation(line: 94, column: 22, scope: !76)
!86 = !DILocation(line: 94, column: 12, scope: !76)
!87 = !DILocation(line: 94, column: 5, scope: !76)
!88 = !DILocation(line: 96, column: 5, scope: !76)
!89 = !DILocation(line: 97, column: 5, scope: !76)
!90 = !DILocation(line: 98, column: 5, scope: !76)
!91 = !DILocation(line: 101, column: 5, scope: !76)
!92 = !DILocation(line: 102, column: 5, scope: !76)
!93 = !DILocation(line: 103, column: 5, scope: !76)
!94 = !DILocation(line: 105, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !38, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 67, type: !4)
!97 = !DILocation(line: 67, column: 12, scope: !95)
!98 = !DILocation(line: 68, column: 10, scope: !95)
!99 = !DILocation(line: 70, column: 20, scope: !95)
!100 = !DILocation(line: 70, column: 10, scope: !95)
!101 = !DILocation(line: 71, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !15, line: 71, column: 9)
!103 = !DILocation(line: 71, column: 14, scope: !102)
!104 = !DILocation(line: 71, column: 9, scope: !95)
!105 = !DILocation(line: 71, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 71, column: 23)
!107 = !DILocation(line: 72, column: 5, scope: !95)
!108 = !DILocation(line: 72, column: 13, scope: !95)
!109 = !DILocation(line: 73, column: 71, scope: !95)
!110 = !DILocation(line: 73, column: 5, scope: !95)
!111 = !DILocation(line: 74, column: 1, scope: !95)
