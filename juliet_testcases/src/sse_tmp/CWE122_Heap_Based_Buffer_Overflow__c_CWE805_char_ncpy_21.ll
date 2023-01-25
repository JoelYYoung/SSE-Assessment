; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21_bad() #0 !dbg !23 {
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
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %3), !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* %4) #6, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end2, !dbg !59

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !60
  store i8* %call, i8** %data.addr, align 8, !dbg !62
  %1 = load i8*, i8** %data.addr, align 8, !dbg !63
  %cmp = icmp eq i8* %1, null, !dbg !65
  br i1 %cmp, label %if.then1, label %if.end, !dbg !66

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !67
  unreachable, !dbg !67

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  br label %if.end2, !dbg !71

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !72
  ret i8* %3, !dbg !73
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !102
  store i8* %call, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %1 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !112
  %2 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !113
  store i8 0, i8* %arrayidx3, align 1, !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %3), !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  call void @free(i8* %4) #6, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !120 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !123
  %tobool = icmp ne i32 %0, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  br label %if.end2, !dbg !128

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !129
  store i8* %call, i8** %data.addr, align 8, !dbg !131
  %1 = load i8*, i8** %data.addr, align 8, !dbg !132
  %cmp = icmp eq i8* %1, null, !dbg !134
  br i1 %cmp, label %if.then1, label %if.end, !dbg !135

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !138
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !140
  ret i8* %3, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i8* null, i8** %data, align 8, !dbg !145
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !146
  %0 = load i8*, i8** %data, align 8, !dbg !147
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !148
  store i8* %call, i8** %data, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !150, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !153
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  %1 = load i8*, i8** %data, align 8, !dbg !156
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !157
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !158
  %2 = load i8*, i8** %data, align 8, !dbg !159
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !159
  store i8 0, i8* %arrayidx3, align 1, !dbg !160
  %3 = load i8*, i8** %data, align 8, !dbg !161
  call void @printLine(i8* %3), !dbg !162
  %4 = load i8*, i8** %data, align 8, !dbg !163
  call void @free(i8* %4) #6, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !166 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !167, metadata !DIExpression()), !dbg !168
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !169
  %tobool = icmp ne i32 %0, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.end2, !dbg !171

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !172
  store i8* %call, i8** %data.addr, align 8, !dbg !174
  %1 = load i8*, i8** %data.addr, align 8, !dbg !175
  %cmp = icmp eq i8* %1, null, !dbg !177
  br i1 %cmp, label %if.then1, label %if.end, !dbg !178

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !179
  unreachable, !dbg !179

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !181
  store i8 0, i8* %arrayidx, align 1, !dbg !182
  br label %if.end2, !dbg !183

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !184
  ret i8* %3, !dbg !185
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 61, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 62, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21_bad", scope: !13, file: !13, line: 38, type: !24, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!42 = !DILocation(line: 49, column: 17, scope: !34)
!43 = !DILocation(line: 49, column: 23, scope: !34)
!44 = !DILocation(line: 49, column: 9, scope: !34)
!45 = !DILocation(line: 50, column: 9, scope: !34)
!46 = !DILocation(line: 50, column: 21, scope: !34)
!47 = !DILocation(line: 51, column: 19, scope: !34)
!48 = !DILocation(line: 51, column: 9, scope: !34)
!49 = !DILocation(line: 52, column: 14, scope: !34)
!50 = !DILocation(line: 52, column: 9, scope: !34)
!51 = !DILocation(line: 54, column: 1, scope: !23)
!52 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !53, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !13, line: 26, type: !7)
!56 = !DILocation(line: 26, column: 32, scope: !52)
!57 = !DILocation(line: 28, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !13, line: 28, column: 8)
!59 = !DILocation(line: 28, column: 8, scope: !52)
!60 = !DILocation(line: 31, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !13, line: 29, column: 5)
!62 = !DILocation(line: 31, column: 14, scope: !61)
!63 = !DILocation(line: 32, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !13, line: 32, column: 13)
!65 = !DILocation(line: 32, column: 18, scope: !64)
!66 = !DILocation(line: 32, column: 13, scope: !61)
!67 = !DILocation(line: 32, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !13, line: 32, column: 27)
!69 = !DILocation(line: 33, column: 9, scope: !61)
!70 = !DILocation(line: 33, column: 17, scope: !61)
!71 = !DILocation(line: 34, column: 5, scope: !61)
!72 = !DILocation(line: 35, column: 12, scope: !52)
!73 = !DILocation(line: 35, column: 5, scope: !52)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_21_good", scope: !13, file: !13, line: 131, type: !24, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 133, column: 5, scope: !74)
!76 = !DILocation(line: 134, column: 5, scope: !74)
!77 = !DILocation(line: 135, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 147, type: !79, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!14, !14, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !13, line: 147, type: !14)
!83 = !DILocation(line: 147, column: 14, scope: !78)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !13, line: 147, type: !81)
!85 = !DILocation(line: 147, column: 27, scope: !78)
!86 = !DILocation(line: 150, column: 22, scope: !78)
!87 = !DILocation(line: 150, column: 12, scope: !78)
!88 = !DILocation(line: 150, column: 5, scope: !78)
!89 = !DILocation(line: 152, column: 5, scope: !78)
!90 = !DILocation(line: 153, column: 5, scope: !78)
!91 = !DILocation(line: 154, column: 5, scope: !78)
!92 = !DILocation(line: 157, column: 5, scope: !78)
!93 = !DILocation(line: 158, column: 5, scope: !78)
!94 = !DILocation(line: 159, column: 5, scope: !78)
!95 = !DILocation(line: 161, column: 5, scope: !78)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 82, type: !24, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !13, line: 84, type: !7)
!98 = !DILocation(line: 84, column: 12, scope: !96)
!99 = !DILocation(line: 85, column: 10, scope: !96)
!100 = !DILocation(line: 86, column: 20, scope: !96)
!101 = !DILocation(line: 87, column: 27, scope: !96)
!102 = !DILocation(line: 87, column: 12, scope: !96)
!103 = !DILocation(line: 87, column: 10, scope: !96)
!104 = !DILocalVariable(name: "source", scope: !105, file: !13, line: 89, type: !35)
!105 = distinct !DILexicalBlock(scope: !96, file: !13, line: 88, column: 5)
!106 = !DILocation(line: 89, column: 14, scope: !105)
!107 = !DILocation(line: 90, column: 9, scope: !105)
!108 = !DILocation(line: 91, column: 9, scope: !105)
!109 = !DILocation(line: 91, column: 23, scope: !105)
!110 = !DILocation(line: 93, column: 17, scope: !105)
!111 = !DILocation(line: 93, column: 23, scope: !105)
!112 = !DILocation(line: 93, column: 9, scope: !105)
!113 = !DILocation(line: 94, column: 9, scope: !105)
!114 = !DILocation(line: 94, column: 21, scope: !105)
!115 = !DILocation(line: 95, column: 19, scope: !105)
!116 = !DILocation(line: 95, column: 9, scope: !105)
!117 = !DILocation(line: 96, column: 14, scope: !105)
!118 = !DILocation(line: 96, column: 9, scope: !105)
!119 = !DILocation(line: 98, column: 1, scope: !96)
!120 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 65, type: !53, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", arg: 1, scope: !120, file: !13, line: 65, type: !7)
!122 = !DILocation(line: 65, column: 37, scope: !120)
!123 = !DILocation(line: 67, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !13, line: 67, column: 8)
!125 = !DILocation(line: 67, column: 8, scope: !120)
!126 = !DILocation(line: 70, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !13, line: 68, column: 5)
!128 = !DILocation(line: 71, column: 5, scope: !127)
!129 = !DILocation(line: 75, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !13, line: 73, column: 5)
!131 = !DILocation(line: 75, column: 14, scope: !130)
!132 = !DILocation(line: 76, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !13, line: 76, column: 13)
!134 = !DILocation(line: 76, column: 18, scope: !133)
!135 = !DILocation(line: 76, column: 13, scope: !130)
!136 = !DILocation(line: 76, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !13, line: 76, column: 27)
!138 = !DILocation(line: 77, column: 9, scope: !130)
!139 = !DILocation(line: 77, column: 17, scope: !130)
!140 = !DILocation(line: 79, column: 12, scope: !120)
!141 = !DILocation(line: 79, column: 5, scope: !120)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 113, type: !24, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!143 = !DILocalVariable(name: "data", scope: !142, file: !13, line: 115, type: !7)
!144 = !DILocation(line: 115, column: 12, scope: !142)
!145 = !DILocation(line: 116, column: 10, scope: !142)
!146 = !DILocation(line: 117, column: 20, scope: !142)
!147 = !DILocation(line: 118, column: 27, scope: !142)
!148 = !DILocation(line: 118, column: 12, scope: !142)
!149 = !DILocation(line: 118, column: 10, scope: !142)
!150 = !DILocalVariable(name: "source", scope: !151, file: !13, line: 120, type: !35)
!151 = distinct !DILexicalBlock(scope: !142, file: !13, line: 119, column: 5)
!152 = !DILocation(line: 120, column: 14, scope: !151)
!153 = !DILocation(line: 121, column: 9, scope: !151)
!154 = !DILocation(line: 122, column: 9, scope: !151)
!155 = !DILocation(line: 122, column: 23, scope: !151)
!156 = !DILocation(line: 124, column: 17, scope: !151)
!157 = !DILocation(line: 124, column: 23, scope: !151)
!158 = !DILocation(line: 124, column: 9, scope: !151)
!159 = !DILocation(line: 125, column: 9, scope: !151)
!160 = !DILocation(line: 125, column: 21, scope: !151)
!161 = !DILocation(line: 126, column: 19, scope: !151)
!162 = !DILocation(line: 126, column: 9, scope: !151)
!163 = !DILocation(line: 127, column: 14, scope: !151)
!164 = !DILocation(line: 127, column: 9, scope: !151)
!165 = !DILocation(line: 129, column: 1, scope: !142)
!166 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 101, type: !53, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", arg: 1, scope: !166, file: !13, line: 101, type: !7)
!168 = !DILocation(line: 101, column: 37, scope: !166)
!169 = !DILocation(line: 103, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !13, line: 103, column: 8)
!171 = !DILocation(line: 103, column: 8, scope: !166)
!172 = !DILocation(line: 106, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !13, line: 104, column: 5)
!174 = !DILocation(line: 106, column: 14, scope: !173)
!175 = !DILocation(line: 107, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !13, line: 107, column: 13)
!177 = !DILocation(line: 107, column: 18, scope: !176)
!178 = !DILocation(line: 107, column: 13, scope: !173)
!179 = !DILocation(line: 107, column: 28, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !13, line: 107, column: 27)
!181 = !DILocation(line: 108, column: 9, scope: !173)
!182 = !DILocation(line: 108, column: 17, scope: !173)
!183 = !DILocation(line: 109, column: 5, scope: !173)
!184 = !DILocation(line: 110, column: 12, scope: !166)
!185 = !DILocation(line: 110, column: 5, scope: !166)
