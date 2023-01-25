; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_badSink(i32* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !25
  %1 = load i32*, i32** %data.addr, align 8, !dbg !26
  %2 = bitcast i32* %1 to i8*, !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %3 = bitcast i32* %arraydecay to i8*, !dbg !27
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !27
  %4 = load i32*, i32** %data.addr, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !28
  %5 = load i32, i32* %arrayidx, align 4, !dbg !28
  call void @printIntLine(i32 %5), !dbg !29
  %6 = load i32*, i32** %data.addr, align 8, !dbg !30
  %7 = bitcast i32* %6 to i8*, !dbg !30
  call void @free(i8* %7) #7, !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  store i32* null, i32** %data, align 8, !dbg !38
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !39
  %0 = bitcast i8* %call to i32*, !dbg !40
  store i32* %0, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %cmp = icmp eq i32* %1, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !48
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_badSink(i32* %2), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_goodG2BSink(i32* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !54, metadata !DIExpression()), !dbg !56
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !56
  %1 = load i32*, i32** %data.addr, align 8, !dbg !57
  %2 = bitcast i32* %1 to i8*, !dbg !58
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %3 = bitcast i32* %arraydecay to i8*, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !58
  %4 = load i32*, i32** %data.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !59
  %5 = load i32, i32* %arrayidx, align 4, !dbg !59
  call void @printIntLine(i32 %5), !dbg !60
  %6 = load i32*, i32** %data.addr, align 8, !dbg !61
  %7 = bitcast i32* %6 to i8*, !dbg !61
  call void @free(i8* %7) #7, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !91
  %0 = bitcast i8* %call to i32*, !dbg !92
  store i32* %0, i32** %data, align 8, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_goodG2BSink(i32* %2), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_badSink", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 21, type: !4)
!19 = !DILocation(line: 21, column: 79, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocation(line: 26, column: 17, scope: !21)
!27 = !DILocation(line: 26, column: 9, scope: !21)
!28 = !DILocation(line: 27, column: 22, scope: !21)
!29 = !DILocation(line: 27, column: 9, scope: !21)
!30 = !DILocation(line: 28, column: 14, scope: !21)
!31 = !DILocation(line: 28, column: 9, scope: !21)
!32 = !DILocation(line: 30, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_bad", scope: !15, file: !15, line: 32, type: !34, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 34, type: !4)
!37 = !DILocation(line: 34, column: 11, scope: !33)
!38 = !DILocation(line: 35, column: 10, scope: !33)
!39 = !DILocation(line: 37, column: 19, scope: !33)
!40 = !DILocation(line: 37, column: 12, scope: !33)
!41 = !DILocation(line: 37, column: 10, scope: !33)
!42 = !DILocation(line: 38, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !33, file: !15, line: 38, column: 9)
!44 = !DILocation(line: 38, column: 14, scope: !43)
!45 = !DILocation(line: 38, column: 9, scope: !33)
!46 = !DILocation(line: 38, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 38, column: 23)
!48 = !DILocation(line: 39, column: 72, scope: !33)
!49 = !DILocation(line: 39, column: 5, scope: !33)
!50 = !DILocation(line: 40, column: 1, scope: !33)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_goodG2BSink", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !15, line: 46, type: !4)
!53 = !DILocation(line: 46, column: 83, scope: !51)
!54 = !DILocalVariable(name: "source", scope: !55, file: !15, line: 49, type: !22)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 48, column: 5)
!56 = !DILocation(line: 49, column: 13, scope: !55)
!57 = !DILocation(line: 51, column: 17, scope: !55)
!58 = !DILocation(line: 51, column: 9, scope: !55)
!59 = !DILocation(line: 52, column: 22, scope: !55)
!60 = !DILocation(line: 52, column: 9, scope: !55)
!61 = !DILocation(line: 53, column: 14, scope: !55)
!62 = !DILocation(line: 53, column: 9, scope: !55)
!63 = !DILocation(line: 55, column: 1, scope: !51)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_41_good", scope: !15, file: !15, line: 68, type: !34, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 70, column: 5, scope: !64)
!66 = !DILocation(line: 71, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 83, type: !68, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!5, !5, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 83, type: !5)
!74 = !DILocation(line: 83, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 83, type: !70)
!76 = !DILocation(line: 83, column: 27, scope: !67)
!77 = !DILocation(line: 86, column: 22, scope: !67)
!78 = !DILocation(line: 86, column: 12, scope: !67)
!79 = !DILocation(line: 86, column: 5, scope: !67)
!80 = !DILocation(line: 88, column: 5, scope: !67)
!81 = !DILocation(line: 89, column: 5, scope: !67)
!82 = !DILocation(line: 90, column: 5, scope: !67)
!83 = !DILocation(line: 93, column: 5, scope: !67)
!84 = !DILocation(line: 94, column: 5, scope: !67)
!85 = !DILocation(line: 95, column: 5, scope: !67)
!86 = !DILocation(line: 97, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !34, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 60, type: !4)
!89 = !DILocation(line: 60, column: 11, scope: !87)
!90 = !DILocation(line: 61, column: 10, scope: !87)
!91 = !DILocation(line: 63, column: 19, scope: !87)
!92 = !DILocation(line: 63, column: 12, scope: !87)
!93 = !DILocation(line: 63, column: 10, scope: !87)
!94 = !DILocation(line: 64, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !87, file: !15, line: 64, column: 9)
!96 = !DILocation(line: 64, column: 14, scope: !95)
!97 = !DILocation(line: 64, column: 9, scope: !87)
!98 = !DILocation(line: 64, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 64, column: 23)
!100 = !DILocation(line: 65, column: 76, scope: !87)
!101 = !DILocation(line: 65, column: 5, scope: !87)
!102 = !DILocation(line: 66, column: 1, scope: !87)
