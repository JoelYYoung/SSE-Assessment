; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !33

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !34
  store i8* %call3, i8** %data, align 8, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %cmp4 = icmp eq i8* %1, null, !dbg !39
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !40

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !41
  unreachable, !dbg !41

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call8 = call i64 @strlen(i8* %arraydecay) #9, !dbg !57
  store i64 %call8, i64* %sourceLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end7
  %3 = load i64, i64* %i, align 8, !dbg !62
  %4 = load i64, i64* %sourceLen, align 8, !dbg !64
  %add = add i64 %4, 1, !dbg !65
  %cmp9 = icmp ult i64 %3, %add, !dbg !66
  br i1 %cmp9, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !70
  %6 = load i8, i8* %arrayidx, align 1, !dbg !70
  %7 = load i8*, i8** %data, align 8, !dbg !71
  %8 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx10 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !71
  store i8 %6, i8* %arrayidx10, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %9, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* %10), !dbg !81
  %11 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* %11) #7, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !114
  store i8* %call1, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !123

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !124
  store i8* %call3, i8** %data, align 8, !dbg !126
  %1 = load i8*, i8** %data, align 8, !dbg !127
  %cmp4 = icmp eq i8* %1, null, !dbg !129
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !130

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !131
  unreachable, !dbg !131

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !140
  %call8 = call i64 @strlen(i8* %arraydecay) #9, !dbg !141
  store i64 %call8, i64* %sourceLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end7
  %3 = load i64, i64* %i, align 8, !dbg !146
  %4 = load i64, i64* %sourceLen, align 8, !dbg !148
  %add = add i64 %4, 1, !dbg !149
  %cmp9 = icmp ult i64 %3, %add, !dbg !150
  br i1 %cmp9, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !154
  %6 = load i8, i8* %arrayidx, align 1, !dbg !154
  %7 = load i8*, i8** %data, align 8, !dbg !155
  %8 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx10 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !155
  store i8 %6, i8* %arrayidx10, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %9, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !163
  call void @printLine(i8* %10), !dbg !164
  %11 = load i8*, i8** %data, align 8, !dbg !165
  call void @free(i8* %11) #7, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 8, scope: !14)
!24 = !DILocation(line: 35, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 35, column: 14, scope: !25)
!27 = !DILocation(line: 36, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 13)
!29 = !DILocation(line: 36, column: 18, scope: !28)
!30 = !DILocation(line: 36, column: 13, scope: !25)
!31 = !DILocation(line: 36, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 36, column: 27)
!33 = !DILocation(line: 37, column: 5, scope: !25)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 5)
!36 = !DILocation(line: 41, column: 14, scope: !35)
!37 = !DILocation(line: 42, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !15, line: 42, column: 13)
!39 = !DILocation(line: 42, column: 18, scope: !38)
!40 = !DILocation(line: 42, column: 13, scope: !35)
!41 = !DILocation(line: 42, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 42, column: 27)
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 45, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 45, column: 14, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 46, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 46, column: 16, scope: !44)
!54 = !DILocalVariable(name: "sourceLen", scope: !44, file: !15, line: 46, type: !50)
!55 = !DILocation(line: 46, column: 19, scope: !44)
!56 = !DILocation(line: 47, column: 28, scope: !44)
!57 = !DILocation(line: 47, column: 21, scope: !44)
!58 = !DILocation(line: 47, column: 19, scope: !44)
!59 = !DILocation(line: 50, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !15, line: 50, column: 9)
!61 = !DILocation(line: 50, column: 14, scope: !60)
!62 = !DILocation(line: 50, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 50, column: 9)
!64 = !DILocation(line: 50, column: 25, scope: !63)
!65 = !DILocation(line: 50, column: 35, scope: !63)
!66 = !DILocation(line: 50, column: 23, scope: !63)
!67 = !DILocation(line: 50, column: 9, scope: !60)
!68 = !DILocation(line: 52, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !15, line: 51, column: 9)
!70 = !DILocation(line: 52, column: 23, scope: !69)
!71 = !DILocation(line: 52, column: 13, scope: !69)
!72 = !DILocation(line: 52, column: 18, scope: !69)
!73 = !DILocation(line: 52, column: 21, scope: !69)
!74 = !DILocation(line: 53, column: 9, scope: !69)
!75 = !DILocation(line: 50, column: 41, scope: !63)
!76 = !DILocation(line: 50, column: 9, scope: !63)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 53, column: 9, scope: !60)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 54, column: 19, scope: !44)
!81 = !DILocation(line: 54, column: 9, scope: !44)
!82 = !DILocation(line: 55, column: 14, scope: !44)
!83 = !DILocation(line: 55, column: 9, scope: !44)
!84 = !DILocation(line: 57, column: 1, scope: !14)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_12_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 98, column: 5, scope: !85)
!87 = !DILocation(line: 99, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 111, type: !89, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 111, type: !91)
!94 = !DILocation(line: 111, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 111, type: !92)
!96 = !DILocation(line: 111, column: 27, scope: !88)
!97 = !DILocation(line: 114, column: 22, scope: !88)
!98 = !DILocation(line: 114, column: 12, scope: !88)
!99 = !DILocation(line: 114, column: 5, scope: !88)
!100 = !DILocation(line: 116, column: 5, scope: !88)
!101 = !DILocation(line: 117, column: 5, scope: !88)
!102 = !DILocation(line: 118, column: 5, scope: !88)
!103 = !DILocation(line: 121, column: 5, scope: !88)
!104 = !DILocation(line: 122, column: 5, scope: !88)
!105 = !DILocation(line: 123, column: 5, scope: !88)
!106 = !DILocation(line: 125, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 67, type: !4)
!109 = !DILocation(line: 67, column: 12, scope: !107)
!110 = !DILocation(line: 68, column: 10, scope: !107)
!111 = !DILocation(line: 69, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 69, column: 8)
!113 = !DILocation(line: 69, column: 8, scope: !107)
!114 = !DILocation(line: 72, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 70, column: 5)
!116 = !DILocation(line: 72, column: 14, scope: !115)
!117 = !DILocation(line: 73, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !15, line: 73, column: 13)
!119 = !DILocation(line: 73, column: 18, scope: !118)
!120 = !DILocation(line: 73, column: 13, scope: !115)
!121 = !DILocation(line: 73, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 73, column: 27)
!123 = !DILocation(line: 74, column: 5, scope: !115)
!124 = !DILocation(line: 78, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !112, file: !15, line: 76, column: 5)
!126 = !DILocation(line: 78, column: 14, scope: !125)
!127 = !DILocation(line: 79, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !15, line: 79, column: 13)
!129 = !DILocation(line: 79, column: 18, scope: !128)
!130 = !DILocation(line: 79, column: 13, scope: !125)
!131 = !DILocation(line: 79, column: 28, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 79, column: 27)
!133 = !DILocalVariable(name: "source", scope: !134, file: !15, line: 82, type: !45)
!134 = distinct !DILexicalBlock(scope: !107, file: !15, line: 81, column: 5)
!135 = !DILocation(line: 82, column: 14, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !15, line: 83, type: !50)
!137 = !DILocation(line: 83, column: 16, scope: !134)
!138 = !DILocalVariable(name: "sourceLen", scope: !134, file: !15, line: 83, type: !50)
!139 = !DILocation(line: 83, column: 19, scope: !134)
!140 = !DILocation(line: 84, column: 28, scope: !134)
!141 = !DILocation(line: 84, column: 21, scope: !134)
!142 = !DILocation(line: 84, column: 19, scope: !134)
!143 = !DILocation(line: 87, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !15, line: 87, column: 9)
!145 = !DILocation(line: 87, column: 14, scope: !144)
!146 = !DILocation(line: 87, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 87, column: 9)
!148 = !DILocation(line: 87, column: 25, scope: !147)
!149 = !DILocation(line: 87, column: 35, scope: !147)
!150 = !DILocation(line: 87, column: 23, scope: !147)
!151 = !DILocation(line: 87, column: 9, scope: !144)
!152 = !DILocation(line: 89, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !15, line: 88, column: 9)
!154 = !DILocation(line: 89, column: 23, scope: !153)
!155 = !DILocation(line: 89, column: 13, scope: !153)
!156 = !DILocation(line: 89, column: 18, scope: !153)
!157 = !DILocation(line: 89, column: 21, scope: !153)
!158 = !DILocation(line: 90, column: 9, scope: !153)
!159 = !DILocation(line: 87, column: 41, scope: !147)
!160 = !DILocation(line: 87, column: 9, scope: !147)
!161 = distinct !{!161, !151, !162, !79}
!162 = !DILocation(line: 90, column: 9, scope: !144)
!163 = !DILocation(line: 91, column: 19, scope: !134)
!164 = !DILocation(line: 91, column: 9, scope: !134)
!165 = !DILocation(line: 92, column: 14, scope: !134)
!166 = !DILocation(line: 92, column: 9, scope: !134)
!167 = !DILocation(line: 94, column: 1, scope: !107)
