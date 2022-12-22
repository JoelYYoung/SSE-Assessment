; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %call1 = call i8* @badSource(i8* %1), !dbg !38
  store i8* %call1, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %3) #6, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* %5) #6, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !64
  %2 = load i8*, i8** %data.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !68
  ret i8* %3, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !95
  store i8* %call, i8** %data, align 8, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %cmp = icmp eq i8* %0, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %call1 = call i8* @goodG2B1Source(i8* %1), !dbg !105
  store i8* %call1, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %3 = load i8*, i8** %data, align 8, !dbg !111
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %3) #6, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %4), !dbg !114
  %5 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %5) #6, !dbg !116
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
  br label %if.end, !dbg !126

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !129
  %2 = load i8*, i8** %data.addr, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !132
  ret i8* %3, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !135, metadata !DIExpression()), !dbg !136
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !137
  store i8* %call, i8** %data, align 8, !dbg !138
  %0 = load i8*, i8** %data, align 8, !dbg !139
  %cmp = icmp eq i8* %0, null, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !145
  %1 = load i8*, i8** %data, align 8, !dbg !146
  %call1 = call i8* @goodG2B2Source(i8* %1), !dbg !147
  store i8* %call1, i8** %data, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !149, metadata !DIExpression()), !dbg !151
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !151
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !152
  %3 = load i8*, i8** %data, align 8, !dbg !153
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %3) #6, !dbg !154
  %4 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* %4), !dbg !156
  %5 = load i8*, i8** %data, align 8, !dbg !157
  call void @free(i8* %5) #6, !dbg !158
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
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !168
  %2 = load i8*, i8** %data.addr, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !172
  ret i8* %3, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 58, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 59, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21_bad", scope: !13, file: !13, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 12, scope: !23)
!28 = !DILocation(line: 40, column: 20, scope: !23)
!29 = !DILocation(line: 40, column: 10, scope: !23)
!30 = !DILocation(line: 41, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !13, line: 41, column: 9)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 41, column: 9, scope: !23)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 41, column: 23)
!36 = !DILocation(line: 42, column: 15, scope: !23)
!37 = !DILocation(line: 43, column: 22, scope: !23)
!38 = !DILocation(line: 43, column: 12, scope: !23)
!39 = !DILocation(line: 43, column: 10, scope: !23)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !13, line: 45, type: !42)
!41 = distinct !DILexicalBlock(scope: !23, file: !13, line: 44, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 45, column: 14, scope: !41)
!46 = !DILocation(line: 47, column: 16, scope: !41)
!47 = !DILocation(line: 47, column: 22, scope: !41)
!48 = !DILocation(line: 47, column: 9, scope: !41)
!49 = !DILocation(line: 48, column: 19, scope: !41)
!50 = !DILocation(line: 48, column: 9, scope: !41)
!51 = !DILocation(line: 49, column: 14, scope: !41)
!52 = !DILocation(line: 49, column: 9, scope: !41)
!53 = !DILocation(line: 51, column: 1, scope: !23)
!54 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!6, !6}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !13, line: 26, type: !6)
!58 = !DILocation(line: 26, column: 32, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !13, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocation(line: 31, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !13, line: 29, column: 5)
!64 = !DILocation(line: 31, column: 9, scope: !63)
!65 = !DILocation(line: 32, column: 9, scope: !63)
!66 = !DILocation(line: 32, column: 21, scope: !63)
!67 = !DILocation(line: 33, column: 5, scope: !63)
!68 = !DILocation(line: 34, column: 12, scope: !54)
!69 = !DILocation(line: 34, column: 5, scope: !54)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_21_good", scope: !13, file: !13, line: 122, type: !24, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 124, column: 5, scope: !70)
!72 = !DILocation(line: 125, column: 5, scope: !70)
!73 = !DILocation(line: 126, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 138, type: !75, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!14, !14, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 138, type: !14)
!79 = !DILocation(line: 138, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 138, type: !77)
!81 = !DILocation(line: 138, column: 27, scope: !74)
!82 = !DILocation(line: 141, column: 22, scope: !74)
!83 = !DILocation(line: 141, column: 12, scope: !74)
!84 = !DILocation(line: 141, column: 5, scope: !74)
!85 = !DILocation(line: 143, column: 5, scope: !74)
!86 = !DILocation(line: 144, column: 5, scope: !74)
!87 = !DILocation(line: 145, column: 5, scope: !74)
!88 = !DILocation(line: 148, column: 5, scope: !74)
!89 = !DILocation(line: 149, column: 5, scope: !74)
!90 = !DILocation(line: 150, column: 5, scope: !74)
!91 = !DILocation(line: 152, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 78, type: !24, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !13, line: 80, type: !6)
!94 = !DILocation(line: 80, column: 12, scope: !92)
!95 = !DILocation(line: 81, column: 20, scope: !92)
!96 = !DILocation(line: 81, column: 10, scope: !92)
!97 = !DILocation(line: 82, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !13, line: 82, column: 9)
!99 = !DILocation(line: 82, column: 14, scope: !98)
!100 = !DILocation(line: 82, column: 9, scope: !92)
!101 = !DILocation(line: 82, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !13, line: 82, column: 23)
!103 = !DILocation(line: 83, column: 20, scope: !92)
!104 = !DILocation(line: 84, column: 27, scope: !92)
!105 = !DILocation(line: 84, column: 12, scope: !92)
!106 = !DILocation(line: 84, column: 10, scope: !92)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !13, line: 86, type: !42)
!108 = distinct !DILexicalBlock(scope: !92, file: !13, line: 85, column: 5)
!109 = !DILocation(line: 86, column: 14, scope: !108)
!110 = !DILocation(line: 88, column: 16, scope: !108)
!111 = !DILocation(line: 88, column: 22, scope: !108)
!112 = !DILocation(line: 88, column: 9, scope: !108)
!113 = !DILocation(line: 89, column: 19, scope: !108)
!114 = !DILocation(line: 89, column: 9, scope: !108)
!115 = !DILocation(line: 90, column: 14, scope: !108)
!116 = !DILocation(line: 90, column: 9, scope: !108)
!117 = !DILocation(line: 92, column: 1, scope: !92)
!118 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 62, type: !55, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", arg: 1, scope: !118, file: !13, line: 62, type: !6)
!120 = !DILocation(line: 62, column: 37, scope: !118)
!121 = !DILocation(line: 64, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 64, column: 8)
!123 = !DILocation(line: 64, column: 8, scope: !118)
!124 = !DILocation(line: 67, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 65, column: 5)
!126 = !DILocation(line: 68, column: 5, scope: !125)
!127 = !DILocation(line: 72, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !13, line: 70, column: 5)
!129 = !DILocation(line: 72, column: 9, scope: !128)
!130 = !DILocation(line: 73, column: 9, scope: !128)
!131 = !DILocation(line: 73, column: 20, scope: !128)
!132 = !DILocation(line: 75, column: 12, scope: !118)
!133 = !DILocation(line: 75, column: 5, scope: !118)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 106, type: !24, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !13, line: 108, type: !6)
!136 = !DILocation(line: 108, column: 12, scope: !134)
!137 = !DILocation(line: 109, column: 20, scope: !134)
!138 = !DILocation(line: 109, column: 10, scope: !134)
!139 = !DILocation(line: 110, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !13, line: 110, column: 9)
!141 = !DILocation(line: 110, column: 14, scope: !140)
!142 = !DILocation(line: 110, column: 9, scope: !134)
!143 = !DILocation(line: 110, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !13, line: 110, column: 23)
!145 = !DILocation(line: 111, column: 20, scope: !134)
!146 = !DILocation(line: 112, column: 27, scope: !134)
!147 = !DILocation(line: 112, column: 12, scope: !134)
!148 = !DILocation(line: 112, column: 10, scope: !134)
!149 = !DILocalVariable(name: "dest", scope: !150, file: !13, line: 114, type: !42)
!150 = distinct !DILexicalBlock(scope: !134, file: !13, line: 113, column: 5)
!151 = !DILocation(line: 114, column: 14, scope: !150)
!152 = !DILocation(line: 116, column: 16, scope: !150)
!153 = !DILocation(line: 116, column: 22, scope: !150)
!154 = !DILocation(line: 116, column: 9, scope: !150)
!155 = !DILocation(line: 117, column: 19, scope: !150)
!156 = !DILocation(line: 117, column: 9, scope: !150)
!157 = !DILocation(line: 118, column: 14, scope: !150)
!158 = !DILocation(line: 118, column: 9, scope: !150)
!159 = !DILocation(line: 120, column: 1, scope: !134)
!160 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 95, type: !55, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!161 = !DILocalVariable(name: "data", arg: 1, scope: !160, file: !13, line: 95, type: !6)
!162 = !DILocation(line: 95, column: 37, scope: !160)
!163 = !DILocation(line: 97, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 97, column: 8)
!165 = !DILocation(line: 97, column: 8, scope: !160)
!166 = !DILocation(line: 100, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !13, line: 98, column: 5)
!168 = !DILocation(line: 100, column: 9, scope: !167)
!169 = !DILocation(line: 101, column: 9, scope: !167)
!170 = !DILocation(line: 101, column: 20, scope: !167)
!171 = !DILocation(line: 102, column: 5, scope: !167)
!172 = !DILocation(line: 103, column: 12, scope: !160)
!173 = !DILocation(line: 103, column: 5, scope: !160)
