; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_21.c"
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
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %call3 = call i64 @strlen(i8* %arraydecay2) #7, !dbg !45
  %call4 = call i8* @strncpy(i8* %arraydecay1, i8* %1, i64 %call3) #8, !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx5, align 1, !dbg !48
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @printLine(i8* %arraydecay6), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end2, !dbg !59

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !63
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !64
  store i8* %call, i8** %dataBuffer, align 8, !dbg !63
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i8* %1, null, !dbg !67
  br i1 %cmp, label %if.then1, label %if.end, !dbg !68

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !72
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !76
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !77
  br label %if.end2, !dbg !78

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !79
  ret i8* %5, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_21_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
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
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_21_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_21_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %call3 = call i64 @strlen(i8* %arraydecay2) #7, !dbg !120
  %call4 = call i8* @strncpy(i8* %arraydecay1, i8* %1, i64 %call3) #8, !dbg !121
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx5, align 1, !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay6), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !127 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !130
  %tobool = icmp ne i32 %0, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !133
  br label %if.end2, !dbg !135

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !136, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !140
  store i8* %call, i8** %dataBuffer, align 8, !dbg !139
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  %cmp = icmp eq i8* %1, null, !dbg !143
  br i1 %cmp, label %if.then1, label %if.end, !dbg !144

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !148
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !151
  store i8* %4, i8** %data.addr, align 8, !dbg !152
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !153
  ret i8* %5, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  store i8* null, i8** %data, align 8, !dbg !158
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !159
  %0 = load i8*, i8** %data, align 8, !dbg !160
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !161
  store i8* %call, i8** %data, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !163, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !166
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !169
  %1 = load i8*, i8** %data, align 8, !dbg !170
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !171
  %call3 = call i64 @strlen(i8* %arraydecay2) #7, !dbg !172
  %call4 = call i8* @strncpy(i8* %arraydecay1, i8* %1, i64 %call3) #8, !dbg !173
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !174
  store i8 0, i8* %arrayidx5, align 1, !dbg !175
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !176
  call void @printLine(i8* %arraydecay6), !dbg !177
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !179 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !180, metadata !DIExpression()), !dbg !181
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !182
  %tobool = icmp ne i32 %0, 0, !dbg !182
  br i1 %tobool, label %if.then, label %if.end2, !dbg !184

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !185, metadata !DIExpression()), !dbg !188
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !189
  store i8* %call, i8** %dataBuffer, align 8, !dbg !188
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !190
  %cmp = icmp eq i8* %1, null, !dbg !192
  br i1 %cmp, label %if.then1, label %if.end, !dbg !193

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !194
  unreachable, !dbg !194

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !197
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !198
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !198
  store i8 0, i8* %arrayidx, align 1, !dbg !199
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !200
  store i8* %4, i8** %data.addr, align 8, !dbg !201
  br label %if.end2, !dbg !202

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !203
  ret i8* %5, !dbg !204
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 67, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 68, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 44, type: !7)
!27 = !DILocation(line: 44, column: 12, scope: !23)
!28 = !DILocation(line: 45, column: 10, scope: !23)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 47, column: 22, scope: !23)
!31 = !DILocation(line: 47, column: 12, scope: !23)
!32 = !DILocation(line: 47, column: 10, scope: !23)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !13, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocation(line: 50, column: 9, scope: !34)
!40 = !DILocation(line: 51, column: 9, scope: !34)
!41 = !DILocation(line: 51, column: 21, scope: !34)
!42 = !DILocation(line: 53, column: 17, scope: !34)
!43 = !DILocation(line: 53, column: 23, scope: !34)
!44 = !DILocation(line: 53, column: 36, scope: !34)
!45 = !DILocation(line: 53, column: 29, scope: !34)
!46 = !DILocation(line: 53, column: 9, scope: !34)
!47 = !DILocation(line: 55, column: 9, scope: !34)
!48 = !DILocation(line: 55, column: 21, scope: !34)
!49 = !DILocation(line: 56, column: 19, scope: !34)
!50 = !DILocation(line: 56, column: 9, scope: !34)
!51 = !DILocation(line: 60, column: 1, scope: !23)
!52 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !53, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !13, line: 26, type: !7)
!56 = !DILocation(line: 26, column: 32, scope: !52)
!57 = !DILocation(line: 28, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !13, line: 28, column: 8)
!59 = !DILocation(line: 28, column: 8, scope: !52)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !13, line: 31, type: !7)
!61 = distinct !DILexicalBlock(scope: !62, file: !13, line: 30, column: 9)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 29, column: 5)
!63 = !DILocation(line: 31, column: 20, scope: !61)
!64 = !DILocation(line: 31, column: 41, scope: !61)
!65 = !DILocation(line: 32, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !13, line: 32, column: 17)
!67 = !DILocation(line: 32, column: 28, scope: !66)
!68 = !DILocation(line: 32, column: 17, scope: !61)
!69 = !DILocation(line: 32, column: 38, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !13, line: 32, column: 37)
!71 = !DILocation(line: 33, column: 20, scope: !61)
!72 = !DILocation(line: 33, column: 13, scope: !61)
!73 = !DILocation(line: 34, column: 13, scope: !61)
!74 = !DILocation(line: 34, column: 31, scope: !61)
!75 = !DILocation(line: 36, column: 20, scope: !61)
!76 = !DILocation(line: 36, column: 31, scope: !61)
!77 = !DILocation(line: 36, column: 18, scope: !61)
!78 = !DILocation(line: 38, column: 5, scope: !62)
!79 = !DILocation(line: 39, column: 12, scope: !52)
!80 = !DILocation(line: 39, column: 5, scope: !52)
!81 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_21_good", scope: !13, file: !13, line: 149, type: !24, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 151, column: 5, scope: !81)
!83 = !DILocation(line: 152, column: 5, scope: !81)
!84 = !DILocation(line: 153, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 165, type: !86, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!14, !14, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !13, line: 165, type: !14)
!90 = !DILocation(line: 165, column: 14, scope: !85)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !13, line: 165, type: !88)
!92 = !DILocation(line: 165, column: 27, scope: !85)
!93 = !DILocation(line: 168, column: 22, scope: !85)
!94 = !DILocation(line: 168, column: 12, scope: !85)
!95 = !DILocation(line: 168, column: 5, scope: !85)
!96 = !DILocation(line: 170, column: 5, scope: !85)
!97 = !DILocation(line: 171, column: 5, scope: !85)
!98 = !DILocation(line: 172, column: 5, scope: !85)
!99 = !DILocation(line: 175, column: 5, scope: !85)
!100 = !DILocation(line: 176, column: 5, scope: !85)
!101 = !DILocation(line: 177, column: 5, scope: !85)
!102 = !DILocation(line: 179, column: 5, scope: !85)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 92, type: !24, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !13, line: 94, type: !7)
!105 = !DILocation(line: 94, column: 12, scope: !103)
!106 = !DILocation(line: 95, column: 10, scope: !103)
!107 = !DILocation(line: 96, column: 20, scope: !103)
!108 = !DILocation(line: 97, column: 27, scope: !103)
!109 = !DILocation(line: 97, column: 12, scope: !103)
!110 = !DILocation(line: 97, column: 10, scope: !103)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !13, line: 99, type: !35)
!112 = distinct !DILexicalBlock(scope: !103, file: !13, line: 98, column: 5)
!113 = !DILocation(line: 99, column: 14, scope: !112)
!114 = !DILocation(line: 100, column: 9, scope: !112)
!115 = !DILocation(line: 101, column: 9, scope: !112)
!116 = !DILocation(line: 101, column: 21, scope: !112)
!117 = !DILocation(line: 103, column: 17, scope: !112)
!118 = !DILocation(line: 103, column: 23, scope: !112)
!119 = !DILocation(line: 103, column: 36, scope: !112)
!120 = !DILocation(line: 103, column: 29, scope: !112)
!121 = !DILocation(line: 103, column: 9, scope: !112)
!122 = !DILocation(line: 105, column: 9, scope: !112)
!123 = !DILocation(line: 105, column: 21, scope: !112)
!124 = !DILocation(line: 106, column: 19, scope: !112)
!125 = !DILocation(line: 106, column: 9, scope: !112)
!126 = !DILocation(line: 110, column: 1, scope: !103)
!127 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 71, type: !53, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", arg: 1, scope: !127, file: !13, line: 71, type: !7)
!129 = !DILocation(line: 71, column: 37, scope: !127)
!130 = !DILocation(line: 73, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !13, line: 73, column: 8)
!132 = !DILocation(line: 73, column: 8, scope: !127)
!133 = !DILocation(line: 76, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !13, line: 74, column: 5)
!135 = !DILocation(line: 77, column: 5, scope: !134)
!136 = !DILocalVariable(name: "dataBuffer", scope: !137, file: !13, line: 81, type: !7)
!137 = distinct !DILexicalBlock(scope: !138, file: !13, line: 80, column: 9)
!138 = distinct !DILexicalBlock(scope: !131, file: !13, line: 79, column: 5)
!139 = !DILocation(line: 81, column: 20, scope: !137)
!140 = !DILocation(line: 81, column: 41, scope: !137)
!141 = !DILocation(line: 82, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !13, line: 82, column: 17)
!143 = !DILocation(line: 82, column: 28, scope: !142)
!144 = !DILocation(line: 82, column: 17, scope: !137)
!145 = !DILocation(line: 82, column: 38, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !13, line: 82, column: 37)
!147 = !DILocation(line: 83, column: 20, scope: !137)
!148 = !DILocation(line: 83, column: 13, scope: !137)
!149 = !DILocation(line: 84, column: 13, scope: !137)
!150 = !DILocation(line: 84, column: 31, scope: !137)
!151 = !DILocation(line: 86, column: 20, scope: !137)
!152 = !DILocation(line: 86, column: 18, scope: !137)
!153 = !DILocation(line: 89, column: 12, scope: !127)
!154 = !DILocation(line: 89, column: 5, scope: !127)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 129, type: !24, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !13, line: 131, type: !7)
!157 = !DILocation(line: 131, column: 12, scope: !155)
!158 = !DILocation(line: 132, column: 10, scope: !155)
!159 = !DILocation(line: 133, column: 20, scope: !155)
!160 = !DILocation(line: 134, column: 27, scope: !155)
!161 = !DILocation(line: 134, column: 12, scope: !155)
!162 = !DILocation(line: 134, column: 10, scope: !155)
!163 = !DILocalVariable(name: "dest", scope: !164, file: !13, line: 136, type: !35)
!164 = distinct !DILexicalBlock(scope: !155, file: !13, line: 135, column: 5)
!165 = !DILocation(line: 136, column: 14, scope: !164)
!166 = !DILocation(line: 137, column: 9, scope: !164)
!167 = !DILocation(line: 138, column: 9, scope: !164)
!168 = !DILocation(line: 138, column: 21, scope: !164)
!169 = !DILocation(line: 140, column: 17, scope: !164)
!170 = !DILocation(line: 140, column: 23, scope: !164)
!171 = !DILocation(line: 140, column: 36, scope: !164)
!172 = !DILocation(line: 140, column: 29, scope: !164)
!173 = !DILocation(line: 140, column: 9, scope: !164)
!174 = !DILocation(line: 142, column: 9, scope: !164)
!175 = !DILocation(line: 142, column: 21, scope: !164)
!176 = !DILocation(line: 143, column: 19, scope: !164)
!177 = !DILocation(line: 143, column: 9, scope: !164)
!178 = !DILocation(line: 147, column: 1, scope: !155)
!179 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 113, type: !53, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!180 = !DILocalVariable(name: "data", arg: 1, scope: !179, file: !13, line: 113, type: !7)
!181 = !DILocation(line: 113, column: 37, scope: !179)
!182 = !DILocation(line: 115, column: 8, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !13, line: 115, column: 8)
!184 = !DILocation(line: 115, column: 8, scope: !179)
!185 = !DILocalVariable(name: "dataBuffer", scope: !186, file: !13, line: 118, type: !7)
!186 = distinct !DILexicalBlock(scope: !187, file: !13, line: 117, column: 9)
!187 = distinct !DILexicalBlock(scope: !183, file: !13, line: 116, column: 5)
!188 = !DILocation(line: 118, column: 20, scope: !186)
!189 = !DILocation(line: 118, column: 41, scope: !186)
!190 = !DILocation(line: 119, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !13, line: 119, column: 17)
!192 = !DILocation(line: 119, column: 28, scope: !191)
!193 = !DILocation(line: 119, column: 17, scope: !186)
!194 = !DILocation(line: 119, column: 38, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 119, column: 37)
!196 = !DILocation(line: 120, column: 20, scope: !186)
!197 = !DILocation(line: 120, column: 13, scope: !186)
!198 = !DILocation(line: 121, column: 13, scope: !186)
!199 = !DILocation(line: 121, column: 31, scope: !186)
!200 = !DILocation(line: 123, column: 20, scope: !186)
!201 = !DILocation(line: 123, column: 18, scope: !186)
!202 = !DILocation(line: 125, column: 5, scope: !187)
!203 = !DILocation(line: 126, column: 12, scope: !179)
!204 = !DILocation(line: 126, column: 5, scope: !179)
