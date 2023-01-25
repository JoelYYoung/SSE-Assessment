; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32*, i32** %data, align 8, !dbg !21
  %call = call i32* @badSource(i32* %0), !dbg !22
  store i32* %call, i32** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !45
  %4 = load i32, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %6 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !46
  store i32 %4, i32* %arrayidx1, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %7, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !55
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !55
  call void @printIntLine(i32 %9), !dbg !56
  %10 = load i32*, i32** %data, align 8, !dbg !57
  %11 = bitcast i32* %10 to i8*, !dbg !57
  call void @free(i8* %11) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !65
  %0 = bitcast i8* %call to i32*, !dbg !66
  store i32* %0, i32** %data.addr, align 8, !dbg !67
  %1 = load i32*, i32** %data.addr, align 8, !dbg !68
  %cmp = icmp eq i32* %1, null, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !74
  ret i32* %2, !dbg !75
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42_good() #0 !dbg !76 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @goodG2BSource(i32* %0), !dbg !104
  store i32* %call, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %2, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !121
  %4 = load i32, i32* %arrayidx, align 4, !dbg !121
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %6 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !122
  store i32 %4, i32* %arrayidx1, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %7, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !130
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !130
  call void @printIntLine(i32 %9), !dbg !131
  %10 = load i32*, i32** %data, align 8, !dbg !132
  %11 = bitcast i32* %10 to i8*, !dbg !132
  call void @free(i8* %11) #6, !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !135 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !136, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !138
  %0 = bitcast i8* %call to i32*, !dbg !139
  store i32* %0, i32** %data.addr, align 8, !dbg !140
  %1 = load i32*, i32** %data.addr, align 8, !dbg !141
  %cmp = icmp eq i32* %1, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.end, !dbg !144

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !147
  ret i32* %2, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !5)
!19 = !DILocation(line: 31, column: 11, scope: !14)
!20 = !DILocation(line: 32, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 22, scope: !14)
!22 = !DILocation(line: 33, column: 12, scope: !14)
!23 = !DILocation(line: 33, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 35, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 35, column: 13, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !15, line: 37, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 37, column: 20, scope: !31)
!36 = !DILocation(line: 39, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !15, line: 39, column: 13)
!38 = !DILocation(line: 39, column: 18, scope: !37)
!39 = !DILocation(line: 39, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 39, column: 13)
!41 = !DILocation(line: 39, column: 27, scope: !40)
!42 = !DILocation(line: 39, column: 13, scope: !37)
!43 = !DILocation(line: 41, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 40, column: 13)
!45 = !DILocation(line: 41, column: 27, scope: !44)
!46 = !DILocation(line: 41, column: 17, scope: !44)
!47 = !DILocation(line: 41, column: 22, scope: !44)
!48 = !DILocation(line: 41, column: 25, scope: !44)
!49 = !DILocation(line: 42, column: 13, scope: !44)
!50 = !DILocation(line: 39, column: 35, scope: !40)
!51 = !DILocation(line: 39, column: 13, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 42, column: 13, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 43, column: 26, scope: !31)
!56 = !DILocation(line: 43, column: 13, scope: !31)
!57 = !DILocation(line: 44, column: 18, scope: !31)
!58 = !DILocation(line: 44, column: 13, scope: !31)
!59 = !DILocation(line: 47, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 21, type: !61, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!5, !5}
!63 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !15, line: 21, type: !5)
!64 = !DILocation(line: 21, column: 30, scope: !60)
!65 = !DILocation(line: 24, column: 19, scope: !60)
!66 = !DILocation(line: 24, column: 12, scope: !60)
!67 = !DILocation(line: 24, column: 10, scope: !60)
!68 = !DILocation(line: 25, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !60, file: !15, line: 25, column: 9)
!70 = !DILocation(line: 25, column: 14, scope: !69)
!71 = !DILocation(line: 25, column: 9, scope: !60)
!72 = !DILocation(line: 25, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 25, column: 23)
!74 = !DILocation(line: 26, column: 12, scope: !60)
!75 = !DILocation(line: 26, column: 5, scope: !60)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_42_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 84, column: 5, scope: !76)
!78 = !DILocation(line: 85, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !80, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!6, !6, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 97, type: !6)
!86 = !DILocation(line: 97, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 97, type: !82)
!88 = !DILocation(line: 97, column: 27, scope: !79)
!89 = !DILocation(line: 100, column: 22, scope: !79)
!90 = !DILocation(line: 100, column: 12, scope: !79)
!91 = !DILocation(line: 100, column: 5, scope: !79)
!92 = !DILocation(line: 102, column: 5, scope: !79)
!93 = !DILocation(line: 103, column: 5, scope: !79)
!94 = !DILocation(line: 104, column: 5, scope: !79)
!95 = !DILocation(line: 107, column: 5, scope: !79)
!96 = !DILocation(line: 108, column: 5, scope: !79)
!97 = !DILocation(line: 109, column: 5, scope: !79)
!98 = !DILocation(line: 111, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 64, type: !5)
!101 = !DILocation(line: 64, column: 11, scope: !99)
!102 = !DILocation(line: 65, column: 10, scope: !99)
!103 = !DILocation(line: 66, column: 26, scope: !99)
!104 = !DILocation(line: 66, column: 12, scope: !99)
!105 = !DILocation(line: 66, column: 10, scope: !99)
!106 = !DILocalVariable(name: "source", scope: !107, file: !15, line: 68, type: !26)
!107 = distinct !DILexicalBlock(scope: !99, file: !15, line: 67, column: 5)
!108 = !DILocation(line: 68, column: 13, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !110, file: !15, line: 70, type: !32)
!110 = distinct !DILexicalBlock(scope: !107, file: !15, line: 69, column: 9)
!111 = !DILocation(line: 70, column: 20, scope: !110)
!112 = !DILocation(line: 72, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !15, line: 72, column: 13)
!114 = !DILocation(line: 72, column: 18, scope: !113)
!115 = !DILocation(line: 72, column: 25, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !15, line: 72, column: 13)
!117 = !DILocation(line: 72, column: 27, scope: !116)
!118 = !DILocation(line: 72, column: 13, scope: !113)
!119 = !DILocation(line: 74, column: 34, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 73, column: 13)
!121 = !DILocation(line: 74, column: 27, scope: !120)
!122 = !DILocation(line: 74, column: 17, scope: !120)
!123 = !DILocation(line: 74, column: 22, scope: !120)
!124 = !DILocation(line: 74, column: 25, scope: !120)
!125 = !DILocation(line: 75, column: 13, scope: !120)
!126 = !DILocation(line: 72, column: 35, scope: !116)
!127 = !DILocation(line: 72, column: 13, scope: !116)
!128 = distinct !{!128, !118, !129, !54}
!129 = !DILocation(line: 75, column: 13, scope: !113)
!130 = !DILocation(line: 76, column: 26, scope: !110)
!131 = !DILocation(line: 76, column: 13, scope: !110)
!132 = !DILocation(line: 77, column: 18, scope: !110)
!133 = !DILocation(line: 77, column: 13, scope: !110)
!134 = !DILocation(line: 80, column: 1, scope: !99)
!135 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 53, type: !61, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", arg: 1, scope: !135, file: !15, line: 53, type: !5)
!137 = !DILocation(line: 53, column: 34, scope: !135)
!138 = !DILocation(line: 56, column: 19, scope: !135)
!139 = !DILocation(line: 56, column: 12, scope: !135)
!140 = !DILocation(line: 56, column: 10, scope: !135)
!141 = !DILocation(line: 57, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !15, line: 57, column: 9)
!143 = !DILocation(line: 57, column: 14, scope: !142)
!144 = !DILocation(line: 57, column: 9, scope: !135)
!145 = !DILocation(line: 57, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 57, column: 23)
!147 = !DILocation(line: 58, column: 12, scope: !135)
!148 = !DILocation(line: 58, column: 5, scope: !135)
