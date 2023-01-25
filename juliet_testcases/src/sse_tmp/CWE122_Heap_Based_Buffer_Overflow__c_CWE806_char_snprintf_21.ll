; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
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
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %5), !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %6) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @badStatic, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !66
  %2 = load i8*, i8** %data.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !67
  store i8 0, i8* %arrayidx, align 1, !dbg !68
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !70
  ret i8* %3, !dbg !71
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21_good() #0 !dbg !72 {
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
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !105
  %1 = load i8*, i8** %data, align 8, !dbg !106
  %call1 = call i8* @goodG2B1Source(i8* %1), !dbg !107
  store i8* %call1, i8** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* %5), !dbg !118
  %6 = load i8*, i8** %data, align 8, !dbg !119
  call void @free(i8* %6) #7, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !122 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !125
  %tobool = icmp ne i32 %0, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !128
  br label %if.end, !dbg !130

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !133
  %2 = load i8*, i8** %data.addr, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !136
  ret i8* %3, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !138 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !139, metadata !DIExpression()), !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !141
  store i8* %call, i8** %data, align 8, !dbg !142
  %0 = load i8*, i8** %data, align 8, !dbg !143
  %cmp = icmp eq i8* %0, null, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !149
  %1 = load i8*, i8** %data, align 8, !dbg !150
  %call1 = call i8* @goodG2B2Source(i8* %1), !dbg !151
  store i8* %call1, i8** %data, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !153, metadata !DIExpression()), !dbg !155
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !155
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !156
  %3 = load i8*, i8** %data, align 8, !dbg !157
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !158
  %4 = load i8*, i8** %data, align 8, !dbg !159
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !160
  %5 = load i8*, i8** %data, align 8, !dbg !161
  call void @printLine(i8* %5), !dbg !162
  %6 = load i8*, i8** %data, align 8, !dbg !163
  call void @free(i8* %6) #7, !dbg !164
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
  br i1 %tobool, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !174
  %2 = load i8*, i8** %data.addr, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !175
  store i8 0, i8* %arrayidx, align 1, !dbg !176
  br label %if.end, !dbg !177

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !178
  ret i8* %3, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 30, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 64, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 65, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21_bad", scope: !13, file: !13, line: 43, type: !24, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 45, type: !6)
!27 = !DILocation(line: 45, column: 12, scope: !23)
!28 = !DILocation(line: 46, column: 20, scope: !23)
!29 = !DILocation(line: 46, column: 10, scope: !23)
!30 = !DILocation(line: 47, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !13, line: 47, column: 9)
!32 = !DILocation(line: 47, column: 14, scope: !31)
!33 = !DILocation(line: 47, column: 9, scope: !23)
!34 = !DILocation(line: 47, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 47, column: 23)
!36 = !DILocation(line: 48, column: 15, scope: !23)
!37 = !DILocation(line: 49, column: 22, scope: !23)
!38 = !DILocation(line: 49, column: 12, scope: !23)
!39 = !DILocation(line: 49, column: 10, scope: !23)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !13, line: 51, type: !42)
!41 = distinct !DILexicalBlock(scope: !23, file: !13, line: 50, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 51, column: 14, scope: !41)
!46 = !DILocation(line: 53, column: 18, scope: !41)
!47 = !DILocation(line: 53, column: 31, scope: !41)
!48 = !DILocation(line: 53, column: 24, scope: !41)
!49 = !DILocation(line: 53, column: 44, scope: !41)
!50 = !DILocation(line: 53, column: 9, scope: !41)
!51 = !DILocation(line: 54, column: 19, scope: !41)
!52 = !DILocation(line: 54, column: 9, scope: !41)
!53 = !DILocation(line: 55, column: 14, scope: !41)
!54 = !DILocation(line: 55, column: 9, scope: !41)
!55 = !DILocation(line: 57, column: 1, scope: !23)
!56 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 32, type: !57, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!6, !6}
!59 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !13, line: 32, type: !6)
!60 = !DILocation(line: 32, column: 32, scope: !56)
!61 = !DILocation(line: 34, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !13, line: 34, column: 8)
!63 = !DILocation(line: 34, column: 8, scope: !56)
!64 = !DILocation(line: 37, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !13, line: 35, column: 5)
!66 = !DILocation(line: 37, column: 9, scope: !65)
!67 = !DILocation(line: 38, column: 9, scope: !65)
!68 = !DILocation(line: 38, column: 21, scope: !65)
!69 = !DILocation(line: 39, column: 5, scope: !65)
!70 = !DILocation(line: 40, column: 12, scope: !56)
!71 = !DILocation(line: 40, column: 5, scope: !56)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_21_good", scope: !13, file: !13, line: 128, type: !24, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 130, column: 5, scope: !72)
!74 = !DILocation(line: 131, column: 5, scope: !72)
!75 = !DILocation(line: 132, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 144, type: !77, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!14, !14, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
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
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 84, type: !24, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 86, type: !6)
!96 = !DILocation(line: 86, column: 12, scope: !94)
!97 = !DILocation(line: 87, column: 20, scope: !94)
!98 = !DILocation(line: 87, column: 10, scope: !94)
!99 = !DILocation(line: 88, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !13, line: 88, column: 9)
!101 = !DILocation(line: 88, column: 14, scope: !100)
!102 = !DILocation(line: 88, column: 9, scope: !94)
!103 = !DILocation(line: 88, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !13, line: 88, column: 23)
!105 = !DILocation(line: 89, column: 20, scope: !94)
!106 = !DILocation(line: 90, column: 27, scope: !94)
!107 = !DILocation(line: 90, column: 12, scope: !94)
!108 = !DILocation(line: 90, column: 10, scope: !94)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !13, line: 92, type: !42)
!110 = distinct !DILexicalBlock(scope: !94, file: !13, line: 91, column: 5)
!111 = !DILocation(line: 92, column: 14, scope: !110)
!112 = !DILocation(line: 94, column: 18, scope: !110)
!113 = !DILocation(line: 94, column: 31, scope: !110)
!114 = !DILocation(line: 94, column: 24, scope: !110)
!115 = !DILocation(line: 94, column: 44, scope: !110)
!116 = !DILocation(line: 94, column: 9, scope: !110)
!117 = !DILocation(line: 95, column: 19, scope: !110)
!118 = !DILocation(line: 95, column: 9, scope: !110)
!119 = !DILocation(line: 96, column: 14, scope: !110)
!120 = !DILocation(line: 96, column: 9, scope: !110)
!121 = !DILocation(line: 98, column: 1, scope: !94)
!122 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 68, type: !57, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", arg: 1, scope: !122, file: !13, line: 68, type: !6)
!124 = !DILocation(line: 68, column: 37, scope: !122)
!125 = !DILocation(line: 70, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 70, column: 8)
!127 = !DILocation(line: 70, column: 8, scope: !122)
!128 = !DILocation(line: 73, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !13, line: 71, column: 5)
!130 = !DILocation(line: 74, column: 5, scope: !129)
!131 = !DILocation(line: 78, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !13, line: 76, column: 5)
!133 = !DILocation(line: 78, column: 9, scope: !132)
!134 = !DILocation(line: 79, column: 9, scope: !132)
!135 = !DILocation(line: 79, column: 20, scope: !132)
!136 = !DILocation(line: 81, column: 12, scope: !122)
!137 = !DILocation(line: 81, column: 5, scope: !122)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 112, type: !24, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!139 = !DILocalVariable(name: "data", scope: !138, file: !13, line: 114, type: !6)
!140 = !DILocation(line: 114, column: 12, scope: !138)
!141 = !DILocation(line: 115, column: 20, scope: !138)
!142 = !DILocation(line: 115, column: 10, scope: !138)
!143 = !DILocation(line: 116, column: 9, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !13, line: 116, column: 9)
!145 = !DILocation(line: 116, column: 14, scope: !144)
!146 = !DILocation(line: 116, column: 9, scope: !138)
!147 = !DILocation(line: 116, column: 24, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !13, line: 116, column: 23)
!149 = !DILocation(line: 117, column: 20, scope: !138)
!150 = !DILocation(line: 118, column: 27, scope: !138)
!151 = !DILocation(line: 118, column: 12, scope: !138)
!152 = !DILocation(line: 118, column: 10, scope: !138)
!153 = !DILocalVariable(name: "dest", scope: !154, file: !13, line: 120, type: !42)
!154 = distinct !DILexicalBlock(scope: !138, file: !13, line: 119, column: 5)
!155 = !DILocation(line: 120, column: 14, scope: !154)
!156 = !DILocation(line: 122, column: 18, scope: !154)
!157 = !DILocation(line: 122, column: 31, scope: !154)
!158 = !DILocation(line: 122, column: 24, scope: !154)
!159 = !DILocation(line: 122, column: 44, scope: !154)
!160 = !DILocation(line: 122, column: 9, scope: !154)
!161 = !DILocation(line: 123, column: 19, scope: !154)
!162 = !DILocation(line: 123, column: 9, scope: !154)
!163 = !DILocation(line: 124, column: 14, scope: !154)
!164 = !DILocation(line: 124, column: 9, scope: !154)
!165 = !DILocation(line: 126, column: 1, scope: !138)
!166 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 101, type: !57, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", arg: 1, scope: !166, file: !13, line: 101, type: !6)
!168 = !DILocation(line: 101, column: 37, scope: !166)
!169 = !DILocation(line: 103, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !13, line: 103, column: 8)
!171 = !DILocation(line: 103, column: 8, scope: !166)
!172 = !DILocation(line: 106, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !13, line: 104, column: 5)
!174 = !DILocation(line: 106, column: 9, scope: !173)
!175 = !DILocation(line: 107, column: 9, scope: !173)
!176 = !DILocation(line: 107, column: 20, scope: !173)
!177 = !DILocation(line: 108, column: 5, scope: !173)
!178 = !DILocation(line: 109, column: 12, scope: !166)
!179 = !DILocation(line: 109, column: 5, scope: !166)
