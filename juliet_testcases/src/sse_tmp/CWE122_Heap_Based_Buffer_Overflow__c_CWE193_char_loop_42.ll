; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !35, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call1 = call i64 @strlen(i8* %arraydecay) #7, !dbg !38
  store i64 %call1, i64* %sourceLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %3 = load i64, i64* %sourceLen, align 8, !dbg !45
  %add = add i64 %3, 1, !dbg !46
  %cmp = icmp ult i64 %2, %add, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !51
  %5 = load i8, i8* %arrayidx, align 1, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !52
  store i8 %5, i8* %arrayidx2, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %9), !dbg !62
  %10 = load i8*, i8** %data, align 8, !dbg !63
  call void @free(i8* %10) #8, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 10) #8, !dbg !71
  store i8* %call, i8** %data.addr, align 8, !dbg !72
  %0 = load i8*, i8** %data.addr, align 8, !dbg !73
  %cmp = icmp eq i8* %0, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !77
  unreachable, !dbg !77

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !79
  ret i8* %1, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #8, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #8, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
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
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %call = call i8* @goodG2BSource(i8* %0), !dbg !108
  store i8* %call, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %call1 = call i64 @strlen(i8* %arraydecay) #7, !dbg !118
  store i64 %call1, i64* %sourceLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !123
  %3 = load i64, i64* %sourceLen, align 8, !dbg !125
  %add = add i64 %3, 1, !dbg !126
  %cmp = icmp ult i64 %2, %add, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !131
  %5 = load i8, i8* %arrayidx, align 1, !dbg !131
  %6 = load i8*, i8** %data, align 8, !dbg !132
  %7 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !132
  store i8 %5, i8* %arrayidx2, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %8, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %9), !dbg !141
  %10 = load i8*, i8** %data, align 8, !dbg !142
  call void @free(i8* %10) #8, !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !145 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !146, metadata !DIExpression()), !dbg !147
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !148
  store i8* %call, i8** %data.addr, align 8, !dbg !149
  %0 = load i8*, i8** %data.addr, align 8, !dbg !150
  %cmp = icmp eq i8* %0, null, !dbg !152
  br i1 %cmp, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !156
  ret i8* %1, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 38, type: !5)
!19 = !DILocation(line: 38, column: 12, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 22, scope: !14)
!22 = !DILocation(line: 40, column: 12, scope: !14)
!23 = !DILocation(line: 40, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 42, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 42, column: 14, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 43, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 43, column: 16, scope: !25)
!35 = !DILocalVariable(name: "sourceLen", scope: !25, file: !15, line: 43, type: !31)
!36 = !DILocation(line: 43, column: 19, scope: !25)
!37 = !DILocation(line: 44, column: 28, scope: !25)
!38 = !DILocation(line: 44, column: 21, scope: !25)
!39 = !DILocation(line: 44, column: 19, scope: !25)
!40 = !DILocation(line: 47, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !25, file: !15, line: 47, column: 9)
!42 = !DILocation(line: 47, column: 14, scope: !41)
!43 = !DILocation(line: 47, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !15, line: 47, column: 9)
!45 = !DILocation(line: 47, column: 25, scope: !44)
!46 = !DILocation(line: 47, column: 35, scope: !44)
!47 = !DILocation(line: 47, column: 23, scope: !44)
!48 = !DILocation(line: 47, column: 9, scope: !41)
!49 = !DILocation(line: 49, column: 30, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !15, line: 48, column: 9)
!51 = !DILocation(line: 49, column: 23, scope: !50)
!52 = !DILocation(line: 49, column: 13, scope: !50)
!53 = !DILocation(line: 49, column: 18, scope: !50)
!54 = !DILocation(line: 49, column: 21, scope: !50)
!55 = !DILocation(line: 50, column: 9, scope: !50)
!56 = !DILocation(line: 47, column: 41, scope: !44)
!57 = !DILocation(line: 47, column: 9, scope: !44)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 50, column: 9, scope: !41)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 51, column: 19, scope: !25)
!62 = !DILocation(line: 51, column: 9, scope: !25)
!63 = !DILocation(line: 52, column: 14, scope: !25)
!64 = !DILocation(line: 52, column: 9, scope: !25)
!65 = !DILocation(line: 54, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 28, type: !67, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!5, !5}
!69 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !15, line: 28, type: !5)
!70 = !DILocation(line: 28, column: 32, scope: !66)
!71 = !DILocation(line: 31, column: 20, scope: !66)
!72 = !DILocation(line: 31, column: 10, scope: !66)
!73 = !DILocation(line: 32, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !66, file: !15, line: 32, column: 9)
!75 = !DILocation(line: 32, column: 14, scope: !74)
!76 = !DILocation(line: 32, column: 9, scope: !66)
!77 = !DILocation(line: 32, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 32, column: 23)
!79 = !DILocation(line: 33, column: 12, scope: !66)
!80 = !DILocation(line: 33, column: 5, scope: !66)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_42_good", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 91, column: 5, scope: !81)
!83 = !DILocation(line: 92, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !85, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 104, type: !87)
!90 = !DILocation(line: 104, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 104, type: !88)
!92 = !DILocation(line: 104, column: 27, scope: !84)
!93 = !DILocation(line: 107, column: 22, scope: !84)
!94 = !DILocation(line: 107, column: 12, scope: !84)
!95 = !DILocation(line: 107, column: 5, scope: !84)
!96 = !DILocation(line: 109, column: 5, scope: !84)
!97 = !DILocation(line: 110, column: 5, scope: !84)
!98 = !DILocation(line: 111, column: 5, scope: !84)
!99 = !DILocation(line: 114, column: 5, scope: !84)
!100 = !DILocation(line: 115, column: 5, scope: !84)
!101 = !DILocation(line: 116, column: 5, scope: !84)
!102 = !DILocation(line: 118, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 71, type: !5)
!105 = !DILocation(line: 71, column: 12, scope: !103)
!106 = !DILocation(line: 72, column: 10, scope: !103)
!107 = !DILocation(line: 73, column: 26, scope: !103)
!108 = !DILocation(line: 73, column: 12, scope: !103)
!109 = !DILocation(line: 73, column: 10, scope: !103)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 75, type: !26)
!111 = distinct !DILexicalBlock(scope: !103, file: !15, line: 74, column: 5)
!112 = !DILocation(line: 75, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !15, line: 76, type: !31)
!114 = !DILocation(line: 76, column: 16, scope: !111)
!115 = !DILocalVariable(name: "sourceLen", scope: !111, file: !15, line: 76, type: !31)
!116 = !DILocation(line: 76, column: 19, scope: !111)
!117 = !DILocation(line: 77, column: 28, scope: !111)
!118 = !DILocation(line: 77, column: 21, scope: !111)
!119 = !DILocation(line: 77, column: 19, scope: !111)
!120 = !DILocation(line: 80, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !15, line: 80, column: 9)
!122 = !DILocation(line: 80, column: 14, scope: !121)
!123 = !DILocation(line: 80, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 80, column: 9)
!125 = !DILocation(line: 80, column: 25, scope: !124)
!126 = !DILocation(line: 80, column: 35, scope: !124)
!127 = !DILocation(line: 80, column: 23, scope: !124)
!128 = !DILocation(line: 80, column: 9, scope: !121)
!129 = !DILocation(line: 82, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !15, line: 81, column: 9)
!131 = !DILocation(line: 82, column: 23, scope: !130)
!132 = !DILocation(line: 82, column: 13, scope: !130)
!133 = !DILocation(line: 82, column: 18, scope: !130)
!134 = !DILocation(line: 82, column: 21, scope: !130)
!135 = !DILocation(line: 83, column: 9, scope: !130)
!136 = !DILocation(line: 80, column: 41, scope: !124)
!137 = !DILocation(line: 80, column: 9, scope: !124)
!138 = distinct !{!138, !128, !139, !60}
!139 = !DILocation(line: 83, column: 9, scope: !121)
!140 = !DILocation(line: 84, column: 19, scope: !111)
!141 = !DILocation(line: 84, column: 9, scope: !111)
!142 = !DILocation(line: 85, column: 14, scope: !111)
!143 = !DILocation(line: 85, column: 9, scope: !111)
!144 = !DILocation(line: 87, column: 1, scope: !103)
!145 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 60, type: !67, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", arg: 1, scope: !145, file: !15, line: 60, type: !5)
!147 = !DILocation(line: 60, column: 36, scope: !145)
!148 = !DILocation(line: 63, column: 20, scope: !145)
!149 = !DILocation(line: 63, column: 10, scope: !145)
!150 = !DILocation(line: 64, column: 9, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !15, line: 64, column: 9)
!152 = !DILocation(line: 64, column: 14, scope: !151)
!153 = !DILocation(line: 64, column: 9, scope: !145)
!154 = !DILocation(line: 64, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 64, column: 23)
!156 = !DILocation(line: 65, column: 12, scope: !145)
!157 = !DILocation(line: 65, column: 5, scope: !145)
