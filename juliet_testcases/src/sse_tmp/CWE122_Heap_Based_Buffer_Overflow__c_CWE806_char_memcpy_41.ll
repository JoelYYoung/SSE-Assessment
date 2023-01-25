; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !25
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !26
  %1 = load i8*, i8** %data.addr, align 8, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  %call = call i64 @strlen(i8* %2) #8, !dbg !29
  %mul = mul i64 %call, 1, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %1, i64 %mul, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %3 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @printLine(i8* %3), !dbg !34
  %4 = load i8*, i8** %data.addr, align 8, !dbg !35
  call void @free(i8* %4) #9, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 100) #9, !dbg !43
  store i8* %call, i8** %data, align 8, !dbg !44
  %0 = load i8*, i8** %data, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !52
  %2 = load i8*, i8** %data, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %3 = load i8*, i8** %data, align 8, !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_badSink(i8* %3), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_goodG2BSink(i8* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !61, metadata !DIExpression()), !dbg !63
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !63
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !64
  %1 = load i8*, i8** %data.addr, align 8, !dbg !65
  %2 = load i8*, i8** %data.addr, align 8, !dbg !66
  %call = call i64 @strlen(i8* %2) #8, !dbg !67
  %mul = mul i64 %call, 1, !dbg !68
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %1, i64 %mul, i1 false), !dbg !64
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %3 = load i8*, i8** %data.addr, align 8, !dbg !71
  call void @printLine(i8* %3), !dbg !72
  %4 = load i8*, i8** %data.addr, align 8, !dbg !73
  call void @free(i8* %4) #9, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #9, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #9, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 100) #9, !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %cmp = icmp eq i8* %0, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_goodG2BSink(i8* %3), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 80, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 28, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 22, scope: !21)
!28 = !DILocation(line: 28, column: 35, scope: !21)
!29 = !DILocation(line: 28, column: 28, scope: !21)
!30 = !DILocation(line: 28, column: 40, scope: !21)
!31 = !DILocation(line: 29, column: 9, scope: !21)
!32 = !DILocation(line: 29, column: 20, scope: !21)
!33 = !DILocation(line: 30, column: 19, scope: !21)
!34 = !DILocation(line: 30, column: 9, scope: !21)
!35 = !DILocation(line: 31, column: 14, scope: !21)
!36 = !DILocation(line: 31, column: 9, scope: !21)
!37 = !DILocation(line: 33, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_bad", scope: !15, file: !15, line: 35, type: !39, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !15, line: 37, type: !4)
!42 = !DILocation(line: 37, column: 12, scope: !38)
!43 = !DILocation(line: 38, column: 20, scope: !38)
!44 = !DILocation(line: 38, column: 10, scope: !38)
!45 = !DILocation(line: 39, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !15, line: 39, column: 9)
!47 = !DILocation(line: 39, column: 14, scope: !46)
!48 = !DILocation(line: 39, column: 9, scope: !38)
!49 = !DILocation(line: 39, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 23)
!51 = !DILocation(line: 41, column: 12, scope: !38)
!52 = !DILocation(line: 41, column: 5, scope: !38)
!53 = !DILocation(line: 42, column: 5, scope: !38)
!54 = !DILocation(line: 42, column: 17, scope: !38)
!55 = !DILocation(line: 43, column: 72, scope: !38)
!56 = !DILocation(line: 43, column: 5, scope: !38)
!57 = !DILocation(line: 44, column: 1, scope: !38)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_goodG2BSink", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !15, line: 50, type: !4)
!60 = !DILocation(line: 50, column: 84, scope: !58)
!61 = !DILocalVariable(name: "dest", scope: !62, file: !15, line: 53, type: !22)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 52, column: 5)
!63 = !DILocation(line: 53, column: 14, scope: !62)
!64 = !DILocation(line: 55, column: 9, scope: !62)
!65 = !DILocation(line: 55, column: 22, scope: !62)
!66 = !DILocation(line: 55, column: 35, scope: !62)
!67 = !DILocation(line: 55, column: 28, scope: !62)
!68 = !DILocation(line: 55, column: 40, scope: !62)
!69 = !DILocation(line: 56, column: 9, scope: !62)
!70 = !DILocation(line: 56, column: 20, scope: !62)
!71 = !DILocation(line: 57, column: 19, scope: !62)
!72 = !DILocation(line: 57, column: 9, scope: !62)
!73 = !DILocation(line: 58, column: 14, scope: !62)
!74 = !DILocation(line: 58, column: 9, scope: !62)
!75 = !DILocation(line: 60, column: 1, scope: !58)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_good", scope: !15, file: !15, line: 74, type: !39, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 76, column: 5, scope: !76)
!78 = !DILocation(line: 77, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 89, type: !80, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 89, type: !82)
!85 = !DILocation(line: 89, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 89, type: !83)
!87 = !DILocation(line: 89, column: 27, scope: !79)
!88 = !DILocation(line: 92, column: 22, scope: !79)
!89 = !DILocation(line: 92, column: 12, scope: !79)
!90 = !DILocation(line: 92, column: 5, scope: !79)
!91 = !DILocation(line: 94, column: 5, scope: !79)
!92 = !DILocation(line: 95, column: 5, scope: !79)
!93 = !DILocation(line: 96, column: 5, scope: !79)
!94 = !DILocation(line: 99, column: 5, scope: !79)
!95 = !DILocation(line: 100, column: 5, scope: !79)
!96 = !DILocation(line: 101, column: 5, scope: !79)
!97 = !DILocation(line: 103, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !39, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 65, type: !4)
!100 = !DILocation(line: 65, column: 12, scope: !98)
!101 = !DILocation(line: 66, column: 20, scope: !98)
!102 = !DILocation(line: 66, column: 10, scope: !98)
!103 = !DILocation(line: 67, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !15, line: 67, column: 9)
!105 = !DILocation(line: 67, column: 14, scope: !104)
!106 = !DILocation(line: 67, column: 9, scope: !98)
!107 = !DILocation(line: 67, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 67, column: 23)
!109 = !DILocation(line: 69, column: 12, scope: !98)
!110 = !DILocation(line: 69, column: 5, scope: !98)
!111 = !DILocation(line: 70, column: 5, scope: !98)
!112 = !DILocation(line: 70, column: 16, scope: !98)
!113 = !DILocation(line: 71, column: 76, scope: !98)
!114 = !DILocation(line: 71, column: 5, scope: !98)
!115 = !DILocation(line: 72, column: 1, scope: !98)
