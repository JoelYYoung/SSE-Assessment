; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_badSink(i8* %data) #0 !dbg !14 {
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
  %call = call i8* @strcat(i8* %arraydecay, i8* %1) #6, !dbg !28
  %2 = load i8*, i8** %data.addr, align 8, !dbg !29
  call void @printLine(i8* %2), !dbg !30
  %3 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @free(i8* %3) #6, !dbg !32
  ret void, !dbg !33
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !39
  store i8* %call, i8** %data, align 8, !dbg !40
  %0 = load i8*, i8** %data, align 8, !dbg !41
  %cmp = icmp eq i8* %0, null, !dbg !43
  br i1 %cmp, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !45
  unreachable, !dbg !45

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_badSink(i8* %3), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_goodG2BSink(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !57, metadata !DIExpression()), !dbg !59
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !59
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !60
  %1 = load i8*, i8** %data.addr, align 8, !dbg !61
  %call = call i8* @strcat(i8* %arraydecay, i8* %1) #6, !dbg !62
  %2 = load i8*, i8** %data.addr, align 8, !dbg !63
  call void @printLine(i8* %2), !dbg !64
  %3 = load i8*, i8** %data.addr, align 8, !dbg !65
  call void @free(i8* %3) #6, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_goodG2BSink(i8* %3), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 74, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 28, column: 16, scope: !21)
!27 = !DILocation(line: 28, column: 22, scope: !21)
!28 = !DILocation(line: 28, column: 9, scope: !21)
!29 = !DILocation(line: 29, column: 19, scope: !21)
!30 = !DILocation(line: 29, column: 9, scope: !21)
!31 = !DILocation(line: 30, column: 14, scope: !21)
!32 = !DILocation(line: 30, column: 9, scope: !21)
!33 = !DILocation(line: 32, column: 1, scope: !14)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_bad", scope: !15, file: !15, line: 34, type: !35, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 36, type: !4)
!38 = !DILocation(line: 36, column: 12, scope: !34)
!39 = !DILocation(line: 37, column: 20, scope: !34)
!40 = !DILocation(line: 37, column: 10, scope: !34)
!41 = !DILocation(line: 38, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !15, line: 38, column: 9)
!43 = !DILocation(line: 38, column: 14, scope: !42)
!44 = !DILocation(line: 38, column: 9, scope: !34)
!45 = !DILocation(line: 38, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 38, column: 23)
!47 = !DILocation(line: 40, column: 12, scope: !34)
!48 = !DILocation(line: 40, column: 5, scope: !34)
!49 = !DILocation(line: 41, column: 5, scope: !34)
!50 = !DILocation(line: 41, column: 17, scope: !34)
!51 = !DILocation(line: 42, column: 66, scope: !34)
!52 = !DILocation(line: 42, column: 5, scope: !34)
!53 = !DILocation(line: 43, column: 1, scope: !34)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_goodG2BSink", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !15, line: 49, type: !4)
!56 = !DILocation(line: 49, column: 78, scope: !54)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !15, line: 52, type: !22)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 51, column: 5)
!59 = !DILocation(line: 52, column: 14, scope: !58)
!60 = !DILocation(line: 54, column: 16, scope: !58)
!61 = !DILocation(line: 54, column: 22, scope: !58)
!62 = !DILocation(line: 54, column: 9, scope: !58)
!63 = !DILocation(line: 55, column: 19, scope: !58)
!64 = !DILocation(line: 55, column: 9, scope: !58)
!65 = !DILocation(line: 56, column: 14, scope: !58)
!66 = !DILocation(line: 56, column: 9, scope: !58)
!67 = !DILocation(line: 58, column: 1, scope: !54)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_good", scope: !15, file: !15, line: 72, type: !35, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 74, column: 5, scope: !68)
!70 = !DILocation(line: 75, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 87, type: !72, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 87, type: !74)
!77 = !DILocation(line: 87, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 87, type: !75)
!79 = !DILocation(line: 87, column: 27, scope: !71)
!80 = !DILocation(line: 90, column: 22, scope: !71)
!81 = !DILocation(line: 90, column: 12, scope: !71)
!82 = !DILocation(line: 90, column: 5, scope: !71)
!83 = !DILocation(line: 92, column: 5, scope: !71)
!84 = !DILocation(line: 93, column: 5, scope: !71)
!85 = !DILocation(line: 94, column: 5, scope: !71)
!86 = !DILocation(line: 97, column: 5, scope: !71)
!87 = !DILocation(line: 98, column: 5, scope: !71)
!88 = !DILocation(line: 99, column: 5, scope: !71)
!89 = !DILocation(line: 101, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !35, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 63, type: !4)
!92 = !DILocation(line: 63, column: 12, scope: !90)
!93 = !DILocation(line: 64, column: 20, scope: !90)
!94 = !DILocation(line: 64, column: 10, scope: !90)
!95 = !DILocation(line: 65, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !15, line: 65, column: 9)
!97 = !DILocation(line: 65, column: 14, scope: !96)
!98 = !DILocation(line: 65, column: 9, scope: !90)
!99 = !DILocation(line: 65, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 65, column: 23)
!101 = !DILocation(line: 67, column: 12, scope: !90)
!102 = !DILocation(line: 67, column: 5, scope: !90)
!103 = !DILocation(line: 68, column: 5, scope: !90)
!104 = !DILocation(line: 68, column: 16, scope: !90)
!105 = !DILocation(line: 69, column: 70, scope: !90)
!106 = !DILocation(line: 69, column: 5, scope: !90)
!107 = !DILocation(line: 70, column: 1, scope: !90)
