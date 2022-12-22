; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !43
  %2 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %3), !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %4) #7, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* @badStatic, align 4, !dbg !56
  %tobool = icmp ne i32 %0, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.end2, !dbg !58

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !59
  store i8* %call, i8** %data.addr, align 8, !dbg !61
  %1 = load i8*, i8** %data.addr, align 8, !dbg !62
  %cmp = icmp eq i8* %1, null, !dbg !64
  br i1 %cmp, label %if.then1, label %if.end, !dbg !65

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !66
  unreachable, !dbg !66

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !68
  store i8 0, i8* %arrayidx, align 1, !dbg !69
  br label %if.end2, !dbg !70

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !71
  ret i8* %3, !dbg !72
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
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
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i8* null, i8** %data, align 8, !dbg !98
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %1 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !111
  store i8 0, i8* %arrayidx2, align 1, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %3), !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %4) #7, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !118 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !121
  %tobool = icmp ne i32 %0, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  br label %if.end2, !dbg !126

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !127
  store i8* %call, i8** %data.addr, align 8, !dbg !129
  %1 = load i8*, i8** %data.addr, align 8, !dbg !130
  %cmp = icmp eq i8* %1, null, !dbg !132
  br i1 %cmp, label %if.then1, label %if.end, !dbg !133

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !136
  store i8 0, i8* %arrayidx, align 1, !dbg !137
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !138
  ret i8* %3, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !140 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !141, metadata !DIExpression()), !dbg !142
  store i8* null, i8** %data, align 8, !dbg !143
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !144
  %0 = load i8*, i8** %data, align 8, !dbg !145
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !146
  store i8* %call, i8** %data, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !151
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %1 = load i8*, i8** %data, align 8, !dbg !154
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !155
  %2 = load i8*, i8** %data, align 8, !dbg !156
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !156
  store i8 0, i8* %arrayidx2, align 1, !dbg !157
  %3 = load i8*, i8** %data, align 8, !dbg !158
  call void @printLine(i8* %3), !dbg !159
  %4 = load i8*, i8** %data, align 8, !dbg !160
  call void @free(i8* %4) #7, !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !163 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !166
  %tobool = icmp ne i32 %0, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.end2, !dbg !168

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !169
  store i8* %call, i8** %data.addr, align 8, !dbg !171
  %1 = load i8*, i8** %data.addr, align 8, !dbg !172
  %cmp = icmp eq i8* %1, null, !dbg !174
  br i1 %cmp, label %if.then1, label %if.end, !dbg !175

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !176
  unreachable, !dbg !176

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !178
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !178
  store i8 0, i8* %arrayidx, align 1, !dbg !179
  br label %if.end2, !dbg !180

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !181
  ret i8* %3, !dbg !182
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 61, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 62, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21_bad", scope: !13, file: !13, line: 38, type: !24, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 40, type: !7)
!27 = !DILocation(line: 40, column: 12, scope: !23)
!28 = !DILocation(line: 41, column: 10, scope: !23)
!29 = !DILocation(line: 42, column: 15, scope: !23)
!30 = !DILocation(line: 43, column: 22, scope: !23)
!31 = !DILocation(line: 43, column: 12, scope: !23)
!32 = !DILocation(line: 43, column: 10, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 45, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 44, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 45, column: 14, scope: !34)
!39 = !DILocation(line: 46, column: 9, scope: !34)
!40 = !DILocation(line: 47, column: 9, scope: !34)
!41 = !DILocation(line: 47, column: 23, scope: !34)
!42 = !DILocation(line: 49, column: 16, scope: !34)
!43 = !DILocation(line: 49, column: 9, scope: !34)
!44 = !DILocation(line: 50, column: 9, scope: !34)
!45 = !DILocation(line: 50, column: 21, scope: !34)
!46 = !DILocation(line: 51, column: 19, scope: !34)
!47 = !DILocation(line: 51, column: 9, scope: !34)
!48 = !DILocation(line: 52, column: 14, scope: !34)
!49 = !DILocation(line: 52, column: 9, scope: !34)
!50 = !DILocation(line: 54, column: 1, scope: !23)
!51 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !52, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7}
!54 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !13, line: 26, type: !7)
!55 = !DILocation(line: 26, column: 32, scope: !51)
!56 = !DILocation(line: 28, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !13, line: 28, column: 8)
!58 = !DILocation(line: 28, column: 8, scope: !51)
!59 = !DILocation(line: 31, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 29, column: 5)
!61 = !DILocation(line: 31, column: 14, scope: !60)
!62 = !DILocation(line: 32, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !13, line: 32, column: 13)
!64 = !DILocation(line: 32, column: 18, scope: !63)
!65 = !DILocation(line: 32, column: 13, scope: !60)
!66 = !DILocation(line: 32, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !13, line: 32, column: 27)
!68 = !DILocation(line: 33, column: 9, scope: !60)
!69 = !DILocation(line: 33, column: 17, scope: !60)
!70 = !DILocation(line: 34, column: 5, scope: !60)
!71 = !DILocation(line: 35, column: 12, scope: !51)
!72 = !DILocation(line: 35, column: 5, scope: !51)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_21_good", scope: !13, file: !13, line: 131, type: !24, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 133, column: 5, scope: !73)
!75 = !DILocation(line: 134, column: 5, scope: !73)
!76 = !DILocation(line: 135, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 147, type: !78, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DISubroutineType(types: !79)
!79 = !{!14, !14, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !13, line: 147, type: !14)
!82 = !DILocation(line: 147, column: 14, scope: !77)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !13, line: 147, type: !80)
!84 = !DILocation(line: 147, column: 27, scope: !77)
!85 = !DILocation(line: 150, column: 22, scope: !77)
!86 = !DILocation(line: 150, column: 12, scope: !77)
!87 = !DILocation(line: 150, column: 5, scope: !77)
!88 = !DILocation(line: 152, column: 5, scope: !77)
!89 = !DILocation(line: 153, column: 5, scope: !77)
!90 = !DILocation(line: 154, column: 5, scope: !77)
!91 = !DILocation(line: 157, column: 5, scope: !77)
!92 = !DILocation(line: 158, column: 5, scope: !77)
!93 = !DILocation(line: 159, column: 5, scope: !77)
!94 = !DILocation(line: 161, column: 5, scope: !77)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 82, type: !24, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !13, line: 84, type: !7)
!97 = !DILocation(line: 84, column: 12, scope: !95)
!98 = !DILocation(line: 85, column: 10, scope: !95)
!99 = !DILocation(line: 86, column: 20, scope: !95)
!100 = !DILocation(line: 87, column: 27, scope: !95)
!101 = !DILocation(line: 87, column: 12, scope: !95)
!102 = !DILocation(line: 87, column: 10, scope: !95)
!103 = !DILocalVariable(name: "source", scope: !104, file: !13, line: 89, type: !35)
!104 = distinct !DILexicalBlock(scope: !95, file: !13, line: 88, column: 5)
!105 = !DILocation(line: 89, column: 14, scope: !104)
!106 = !DILocation(line: 90, column: 9, scope: !104)
!107 = !DILocation(line: 91, column: 9, scope: !104)
!108 = !DILocation(line: 91, column: 23, scope: !104)
!109 = !DILocation(line: 93, column: 16, scope: !104)
!110 = !DILocation(line: 93, column: 9, scope: !104)
!111 = !DILocation(line: 94, column: 9, scope: !104)
!112 = !DILocation(line: 94, column: 21, scope: !104)
!113 = !DILocation(line: 95, column: 19, scope: !104)
!114 = !DILocation(line: 95, column: 9, scope: !104)
!115 = !DILocation(line: 96, column: 14, scope: !104)
!116 = !DILocation(line: 96, column: 9, scope: !104)
!117 = !DILocation(line: 98, column: 1, scope: !95)
!118 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 65, type: !52, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", arg: 1, scope: !118, file: !13, line: 65, type: !7)
!120 = !DILocation(line: 65, column: 37, scope: !118)
!121 = !DILocation(line: 67, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 67, column: 8)
!123 = !DILocation(line: 67, column: 8, scope: !118)
!124 = !DILocation(line: 70, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 68, column: 5)
!126 = !DILocation(line: 71, column: 5, scope: !125)
!127 = !DILocation(line: 75, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !13, line: 73, column: 5)
!129 = !DILocation(line: 75, column: 14, scope: !128)
!130 = !DILocation(line: 76, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !13, line: 76, column: 13)
!132 = !DILocation(line: 76, column: 18, scope: !131)
!133 = !DILocation(line: 76, column: 13, scope: !128)
!134 = !DILocation(line: 76, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !13, line: 76, column: 27)
!136 = !DILocation(line: 77, column: 9, scope: !128)
!137 = !DILocation(line: 77, column: 17, scope: !128)
!138 = !DILocation(line: 79, column: 12, scope: !118)
!139 = !DILocation(line: 79, column: 5, scope: !118)
!140 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 113, type: !24, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocalVariable(name: "data", scope: !140, file: !13, line: 115, type: !7)
!142 = !DILocation(line: 115, column: 12, scope: !140)
!143 = !DILocation(line: 116, column: 10, scope: !140)
!144 = !DILocation(line: 117, column: 20, scope: !140)
!145 = !DILocation(line: 118, column: 27, scope: !140)
!146 = !DILocation(line: 118, column: 12, scope: !140)
!147 = !DILocation(line: 118, column: 10, scope: !140)
!148 = !DILocalVariable(name: "source", scope: !149, file: !13, line: 120, type: !35)
!149 = distinct !DILexicalBlock(scope: !140, file: !13, line: 119, column: 5)
!150 = !DILocation(line: 120, column: 14, scope: !149)
!151 = !DILocation(line: 121, column: 9, scope: !149)
!152 = !DILocation(line: 122, column: 9, scope: !149)
!153 = !DILocation(line: 122, column: 23, scope: !149)
!154 = !DILocation(line: 124, column: 16, scope: !149)
!155 = !DILocation(line: 124, column: 9, scope: !149)
!156 = !DILocation(line: 125, column: 9, scope: !149)
!157 = !DILocation(line: 125, column: 21, scope: !149)
!158 = !DILocation(line: 126, column: 19, scope: !149)
!159 = !DILocation(line: 126, column: 9, scope: !149)
!160 = !DILocation(line: 127, column: 14, scope: !149)
!161 = !DILocation(line: 127, column: 9, scope: !149)
!162 = !DILocation(line: 129, column: 1, scope: !140)
!163 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 101, type: !52, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!164 = !DILocalVariable(name: "data", arg: 1, scope: !163, file: !13, line: 101, type: !7)
!165 = !DILocation(line: 101, column: 37, scope: !163)
!166 = !DILocation(line: 103, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !13, line: 103, column: 8)
!168 = !DILocation(line: 103, column: 8, scope: !163)
!169 = !DILocation(line: 106, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !13, line: 104, column: 5)
!171 = !DILocation(line: 106, column: 14, scope: !170)
!172 = !DILocation(line: 107, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !13, line: 107, column: 13)
!174 = !DILocation(line: 107, column: 18, scope: !173)
!175 = !DILocation(line: 107, column: 13, scope: !170)
!176 = !DILocation(line: 107, column: 28, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !13, line: 107, column: 27)
!178 = !DILocation(line: 108, column: 9, scope: !170)
!179 = !DILocation(line: 108, column: 17, scope: !170)
!180 = !DILocation(line: 109, column: 5, scope: !170)
!181 = !DILocation(line: 110, column: 12, scope: !163)
!182 = !DILocation(line: 110, column: 5, scope: !163)
