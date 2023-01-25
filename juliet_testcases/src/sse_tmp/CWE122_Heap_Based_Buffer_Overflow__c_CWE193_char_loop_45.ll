; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !11
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %1, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #7, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #7, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !64, metadata !DIExpression()), !dbg !69
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !69
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @strlen(i8* %arraydecay) #9, !dbg !78
  store i64 %call, i64* %sourceLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !83
  %3 = load i64, i64* %sourceLen, align 8, !dbg !85
  %add = add i64 %3, 1, !dbg !86
  %cmp = icmp ult i64 %2, %add, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !91
  %5 = load i8, i8* %arrayidx, align 1, !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  %7 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !92
  store i8 %5, i8* %arrayidx1, align 1, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %8, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %9), !dbg !102
  %10 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* %10) #7, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  store i8* %1, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_goodG2BData, align 8, !dbg !119
  call void @goodG2BSink(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !122 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_goodG2BData, align 8, !dbg !125
  store i8* %0, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !133
  %call = call i64 @strlen(i8* %arraydecay) #9, !dbg !134
  store i64 %call, i64* %sourceLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !139
  %3 = load i64, i64* %sourceLen, align 8, !dbg !141
  %add = add i64 %3, 1, !dbg !142
  %cmp = icmp ult i64 %2, %add, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !147
  %5 = load i8, i8* %arrayidx, align 1, !dbg !147
  %6 = load i8*, i8** %data, align 8, !dbg !148
  %7 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !148
  store i8 %5, i8* %arrayidx1, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %8, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !156
  call void @printLine(i8* %9), !dbg !157
  %10 = load i8*, i8** %data, align 8, !dbg !158
  call void @free(i8* %10) #7, !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_badData", scope: !2, file: !13, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_goodG2BData", scope: !2, file: !13, line: 27, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_bad", scope: !13, file: !13, line: 49, type: !21, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 51, type: !6)
!24 = !DILocation(line: 51, column: 12, scope: !20)
!25 = !DILocation(line: 52, column: 10, scope: !20)
!26 = !DILocation(line: 54, column: 20, scope: !20)
!27 = !DILocation(line: 54, column: 10, scope: !20)
!28 = !DILocation(line: 55, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 55, column: 9)
!30 = !DILocation(line: 55, column: 14, scope: !29)
!31 = !DILocation(line: 55, column: 9, scope: !20)
!32 = !DILocation(line: 55, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 55, column: 23)
!34 = !DILocation(line: 56, column: 72, scope: !20)
!35 = !DILocation(line: 56, column: 70, scope: !20)
!36 = !DILocation(line: 57, column: 5, scope: !20)
!37 = !DILocation(line: 58, column: 1, scope: !20)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_45_good", scope: !13, file: !13, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 96, column: 5, scope: !38)
!40 = !DILocation(line: 97, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 108, type: !42, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !13, line: 108, type: !44)
!47 = !DILocation(line: 108, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !13, line: 108, type: !45)
!49 = !DILocation(line: 108, column: 27, scope: !41)
!50 = !DILocation(line: 111, column: 22, scope: !41)
!51 = !DILocation(line: 111, column: 12, scope: !41)
!52 = !DILocation(line: 111, column: 5, scope: !41)
!53 = !DILocation(line: 113, column: 5, scope: !41)
!54 = !DILocation(line: 114, column: 5, scope: !41)
!55 = !DILocation(line: 115, column: 5, scope: !41)
!56 = !DILocation(line: 118, column: 5, scope: !41)
!57 = !DILocation(line: 119, column: 5, scope: !41)
!58 = !DILocation(line: 120, column: 5, scope: !41)
!59 = !DILocation(line: 122, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 31, type: !21, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !13, line: 33, type: !6)
!62 = !DILocation(line: 33, column: 12, scope: !60)
!63 = !DILocation(line: 33, column: 19, scope: !60)
!64 = !DILocalVariable(name: "source", scope: !65, file: !13, line: 35, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !13, line: 34, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 11)
!69 = !DILocation(line: 35, column: 14, scope: !65)
!70 = !DILocalVariable(name: "i", scope: !65, file: !13, line: 36, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !72, line: 46, baseType: !73)
!72 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!73 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!74 = !DILocation(line: 36, column: 16, scope: !65)
!75 = !DILocalVariable(name: "sourceLen", scope: !65, file: !13, line: 36, type: !71)
!76 = !DILocation(line: 36, column: 19, scope: !65)
!77 = !DILocation(line: 37, column: 28, scope: !65)
!78 = !DILocation(line: 37, column: 21, scope: !65)
!79 = !DILocation(line: 37, column: 19, scope: !65)
!80 = !DILocation(line: 40, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !65, file: !13, line: 40, column: 9)
!82 = !DILocation(line: 40, column: 14, scope: !81)
!83 = !DILocation(line: 40, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !13, line: 40, column: 9)
!85 = !DILocation(line: 40, column: 25, scope: !84)
!86 = !DILocation(line: 40, column: 35, scope: !84)
!87 = !DILocation(line: 40, column: 23, scope: !84)
!88 = !DILocation(line: 40, column: 9, scope: !81)
!89 = !DILocation(line: 42, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !13, line: 41, column: 9)
!91 = !DILocation(line: 42, column: 23, scope: !90)
!92 = !DILocation(line: 42, column: 13, scope: !90)
!93 = !DILocation(line: 42, column: 18, scope: !90)
!94 = !DILocation(line: 42, column: 21, scope: !90)
!95 = !DILocation(line: 43, column: 9, scope: !90)
!96 = !DILocation(line: 40, column: 41, scope: !84)
!97 = !DILocation(line: 40, column: 9, scope: !84)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 43, column: 9, scope: !81)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 44, column: 19, scope: !65)
!102 = !DILocation(line: 44, column: 9, scope: !65)
!103 = !DILocation(line: 45, column: 14, scope: !65)
!104 = !DILocation(line: 45, column: 9, scope: !65)
!105 = !DILocation(line: 47, column: 1, scope: !60)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 85, type: !6)
!108 = !DILocation(line: 85, column: 12, scope: !106)
!109 = !DILocation(line: 86, column: 10, scope: !106)
!110 = !DILocation(line: 88, column: 20, scope: !106)
!111 = !DILocation(line: 88, column: 10, scope: !106)
!112 = !DILocation(line: 89, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !13, line: 89, column: 9)
!114 = !DILocation(line: 89, column: 14, scope: !113)
!115 = !DILocation(line: 89, column: 9, scope: !106)
!116 = !DILocation(line: 89, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 89, column: 23)
!118 = !DILocation(line: 90, column: 76, scope: !106)
!119 = !DILocation(line: 90, column: 74, scope: !106)
!120 = !DILocation(line: 91, column: 5, scope: !106)
!121 = !DILocation(line: 92, column: 1, scope: !106)
!122 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 65, type: !21, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", scope: !122, file: !13, line: 67, type: !6)
!124 = !DILocation(line: 67, column: 12, scope: !122)
!125 = !DILocation(line: 67, column: 19, scope: !122)
!126 = !DILocalVariable(name: "source", scope: !127, file: !13, line: 69, type: !66)
!127 = distinct !DILexicalBlock(scope: !122, file: !13, line: 68, column: 5)
!128 = !DILocation(line: 69, column: 14, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !13, line: 70, type: !71)
!130 = !DILocation(line: 70, column: 16, scope: !127)
!131 = !DILocalVariable(name: "sourceLen", scope: !127, file: !13, line: 70, type: !71)
!132 = !DILocation(line: 70, column: 19, scope: !127)
!133 = !DILocation(line: 71, column: 28, scope: !127)
!134 = !DILocation(line: 71, column: 21, scope: !127)
!135 = !DILocation(line: 71, column: 19, scope: !127)
!136 = !DILocation(line: 74, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !13, line: 74, column: 9)
!138 = !DILocation(line: 74, column: 14, scope: !137)
!139 = !DILocation(line: 74, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !13, line: 74, column: 9)
!141 = !DILocation(line: 74, column: 25, scope: !140)
!142 = !DILocation(line: 74, column: 35, scope: !140)
!143 = !DILocation(line: 74, column: 23, scope: !140)
!144 = !DILocation(line: 74, column: 9, scope: !137)
!145 = !DILocation(line: 76, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !13, line: 75, column: 9)
!147 = !DILocation(line: 76, column: 23, scope: !146)
!148 = !DILocation(line: 76, column: 13, scope: !146)
!149 = !DILocation(line: 76, column: 18, scope: !146)
!150 = !DILocation(line: 76, column: 21, scope: !146)
!151 = !DILocation(line: 77, column: 9, scope: !146)
!152 = !DILocation(line: 74, column: 41, scope: !140)
!153 = !DILocation(line: 74, column: 9, scope: !140)
!154 = distinct !{!154, !144, !155, !100}
!155 = !DILocation(line: 77, column: 9, scope: !137)
!156 = !DILocation(line: 78, column: 19, scope: !127)
!157 = !DILocation(line: 78, column: 9, scope: !127)
!158 = !DILocation(line: 79, column: 14, scope: !127)
!159 = !DILocation(line: 79, column: 9, scope: !127)
!160 = !DILocation(line: 81, column: 1, scope: !122)
