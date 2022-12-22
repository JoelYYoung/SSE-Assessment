; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21_bad() #0 !dbg !23 {
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
  %call2 = call i8* @strncat(i8* %1, i8* %arraydecay1, i64 100) #6, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %2), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* %3) #6, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end2, !dbg !57

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !58
  store i8* %call, i8** %data.addr, align 8, !dbg !60
  %1 = load i8*, i8** %data.addr, align 8, !dbg !61
  %cmp = icmp eq i8* %1, null, !dbg !63
  br i1 %cmp, label %if.then1, label %if.end, !dbg !64

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !65
  unreachable, !dbg !65

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !67
  store i8 0, i8* %arrayidx, align 1, !dbg !68
  br label %if.end2, !dbg !69

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !70
  ret i8* %3, !dbg !71
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
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
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  %call2 = call i8* @strncat(i8* %1, i8* %arraydecay1, i64 100) #6, !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %2), !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %3) #6, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end2, !dbg !124

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !125
  store i8* %call, i8** %data.addr, align 8, !dbg !127
  %1 = load i8*, i8** %data.addr, align 8, !dbg !128
  %cmp = icmp eq i8* %1, null, !dbg !130
  br i1 %cmp, label %if.then1, label %if.end, !dbg !131

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !136
  ret i8* %3, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !138 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !139, metadata !DIExpression()), !dbg !140
  store i8* null, i8** %data, align 8, !dbg !141
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !142
  %0 = load i8*, i8** %data, align 8, !dbg !143
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !144
  store i8* %call, i8** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !149
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !150
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %1 = load i8*, i8** %data, align 8, !dbg !152
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !153
  %call2 = call i8* @strncat(i8* %1, i8* %arraydecay1, i64 100) #6, !dbg !154
  %2 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* %2), !dbg !156
  %3 = load i8*, i8** %data, align 8, !dbg !157
  call void @free(i8* %3) #6, !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !160 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !163
  %tobool = icmp ne i32 %0, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end2, !dbg !165

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !166
  store i8* %call, i8** %data.addr, align 8, !dbg !168
  %1 = load i8*, i8** %data.addr, align 8, !dbg !169
  %cmp = icmp eq i8* %1, null, !dbg !171
  br i1 %cmp, label %if.then1, label %if.end, !dbg !172

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !175
  store i8 0, i8* %arrayidx, align 1, !dbg !176
  br label %if.end2, !dbg !177

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !178
  ret i8* %3, !dbg !179
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 60, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 61, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21_bad", scope: !13, file: !13, line: 38, type: !24, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!45 = !DILocation(line: 50, column: 19, scope: !34)
!46 = !DILocation(line: 50, column: 9, scope: !34)
!47 = !DILocation(line: 51, column: 14, scope: !34)
!48 = !DILocation(line: 51, column: 9, scope: !34)
!49 = !DILocation(line: 53, column: 1, scope: !23)
!50 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !51, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !13, line: 26, type: !7)
!54 = !DILocation(line: 26, column: 32, scope: !50)
!55 = !DILocation(line: 28, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !13, line: 28, column: 8)
!57 = !DILocation(line: 28, column: 8, scope: !50)
!58 = !DILocation(line: 31, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !13, line: 29, column: 5)
!60 = !DILocation(line: 31, column: 14, scope: !59)
!61 = !DILocation(line: 32, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !13, line: 32, column: 13)
!63 = !DILocation(line: 32, column: 18, scope: !62)
!64 = !DILocation(line: 32, column: 13, scope: !59)
!65 = !DILocation(line: 32, column: 28, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !13, line: 32, column: 27)
!67 = !DILocation(line: 33, column: 9, scope: !59)
!68 = !DILocation(line: 33, column: 17, scope: !59)
!69 = !DILocation(line: 34, column: 5, scope: !59)
!70 = !DILocation(line: 35, column: 12, scope: !50)
!71 = !DILocation(line: 35, column: 5, scope: !50)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_21_good", scope: !13, file: !13, line: 128, type: !24, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 130, column: 5, scope: !72)
!74 = !DILocation(line: 131, column: 5, scope: !72)
!75 = !DILocation(line: 132, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 144, type: !77, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!14, !14, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !13, line: 144, type: !14)
!81 = !DILocation(line: 144, column: 14, scope: !76)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !13, line: 144, type: !79)
!83 = !DILocation(line: 144, column: 27, scope: !76)
!84 = !DILocation(line: 147, column: 22, scope: !76)
!85 = !DILocation(line: 147, column: 12, scope: !76)
!86 = !DILocation(line: 147, column: 5, scope: !76)
!87 = !DILocation(line: 149, column: 5, scope: !76)
!88 = !DILocation(line: 150, column: 5, scope: !76)
!89 = !DILocation(line: 151, column: 5, scope: !76)
!90 = !DILocation(line: 154, column: 5, scope: !76)
!91 = !DILocation(line: 155, column: 5, scope: !76)
!92 = !DILocation(line: 156, column: 5, scope: !76)
!93 = !DILocation(line: 158, column: 5, scope: !76)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 81, type: !24, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 83, type: !7)
!96 = !DILocation(line: 83, column: 12, scope: !94)
!97 = !DILocation(line: 84, column: 10, scope: !94)
!98 = !DILocation(line: 85, column: 20, scope: !94)
!99 = !DILocation(line: 86, column: 27, scope: !94)
!100 = !DILocation(line: 86, column: 12, scope: !94)
!101 = !DILocation(line: 86, column: 10, scope: !94)
!102 = !DILocalVariable(name: "source", scope: !103, file: !13, line: 88, type: !35)
!103 = distinct !DILexicalBlock(scope: !94, file: !13, line: 87, column: 5)
!104 = !DILocation(line: 88, column: 14, scope: !103)
!105 = !DILocation(line: 89, column: 9, scope: !103)
!106 = !DILocation(line: 90, column: 9, scope: !103)
!107 = !DILocation(line: 90, column: 23, scope: !103)
!108 = !DILocation(line: 92, column: 17, scope: !103)
!109 = !DILocation(line: 92, column: 23, scope: !103)
!110 = !DILocation(line: 92, column: 9, scope: !103)
!111 = !DILocation(line: 93, column: 19, scope: !103)
!112 = !DILocation(line: 93, column: 9, scope: !103)
!113 = !DILocation(line: 94, column: 14, scope: !103)
!114 = !DILocation(line: 94, column: 9, scope: !103)
!115 = !DILocation(line: 96, column: 1, scope: !94)
!116 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 64, type: !51, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !13, line: 64, type: !7)
!118 = !DILocation(line: 64, column: 37, scope: !116)
!119 = !DILocation(line: 66, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 66, column: 8)
!121 = !DILocation(line: 66, column: 8, scope: !116)
!122 = !DILocation(line: 69, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 67, column: 5)
!124 = !DILocation(line: 70, column: 5, scope: !123)
!125 = !DILocation(line: 74, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !13, line: 72, column: 5)
!127 = !DILocation(line: 74, column: 14, scope: !126)
!128 = !DILocation(line: 75, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !13, line: 75, column: 13)
!130 = !DILocation(line: 75, column: 18, scope: !129)
!131 = !DILocation(line: 75, column: 13, scope: !126)
!132 = !DILocation(line: 75, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 75, column: 27)
!134 = !DILocation(line: 76, column: 9, scope: !126)
!135 = !DILocation(line: 76, column: 17, scope: !126)
!136 = !DILocation(line: 78, column: 12, scope: !116)
!137 = !DILocation(line: 78, column: 5, scope: !116)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 111, type: !24, scopeLine: 112, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!139 = !DILocalVariable(name: "data", scope: !138, file: !13, line: 113, type: !7)
!140 = !DILocation(line: 113, column: 12, scope: !138)
!141 = !DILocation(line: 114, column: 10, scope: !138)
!142 = !DILocation(line: 115, column: 20, scope: !138)
!143 = !DILocation(line: 116, column: 27, scope: !138)
!144 = !DILocation(line: 116, column: 12, scope: !138)
!145 = !DILocation(line: 116, column: 10, scope: !138)
!146 = !DILocalVariable(name: "source", scope: !147, file: !13, line: 118, type: !35)
!147 = distinct !DILexicalBlock(scope: !138, file: !13, line: 117, column: 5)
!148 = !DILocation(line: 118, column: 14, scope: !147)
!149 = !DILocation(line: 119, column: 9, scope: !147)
!150 = !DILocation(line: 120, column: 9, scope: !147)
!151 = !DILocation(line: 120, column: 23, scope: !147)
!152 = !DILocation(line: 122, column: 17, scope: !147)
!153 = !DILocation(line: 122, column: 23, scope: !147)
!154 = !DILocation(line: 122, column: 9, scope: !147)
!155 = !DILocation(line: 123, column: 19, scope: !147)
!156 = !DILocation(line: 123, column: 9, scope: !147)
!157 = !DILocation(line: 124, column: 14, scope: !147)
!158 = !DILocation(line: 124, column: 9, scope: !147)
!159 = !DILocation(line: 126, column: 1, scope: !138)
!160 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 99, type: !51, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!161 = !DILocalVariable(name: "data", arg: 1, scope: !160, file: !13, line: 99, type: !7)
!162 = !DILocation(line: 99, column: 37, scope: !160)
!163 = !DILocation(line: 101, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 101, column: 8)
!165 = !DILocation(line: 101, column: 8, scope: !160)
!166 = !DILocation(line: 104, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !13, line: 102, column: 5)
!168 = !DILocation(line: 104, column: 14, scope: !167)
!169 = !DILocation(line: 105, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !13, line: 105, column: 13)
!171 = !DILocation(line: 105, column: 18, scope: !170)
!172 = !DILocation(line: 105, column: 13, scope: !167)
!173 = !DILocation(line: 105, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !13, line: 105, column: 27)
!175 = !DILocation(line: 106, column: 9, scope: !167)
!176 = !DILocation(line: 106, column: 17, scope: !167)
!177 = !DILocation(line: 107, column: 5, scope: !167)
!178 = !DILocation(line: 108, column: 12, scope: !160)
!179 = !DILocation(line: 108, column: 5, scope: !160)
