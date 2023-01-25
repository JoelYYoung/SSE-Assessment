; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_21.c"
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_21_bad() #0 !dbg !23 {
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
  %call3 = call i64 @strlen(i8* %arraydecay2) #8, !dbg !45
  %mul = mul i64 %call3, 1, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !42
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx4, align 1, !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @printLine(i8* %arraydecay5), !dbg !50
  %2 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* %2) #9, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end2, !dbg !61

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #9, !dbg !62
  store i8* %call, i8** %data.addr, align 8, !dbg !64
  %1 = load i8*, i8** %data.addr, align 8, !dbg !65
  %cmp = icmp eq i8* %1, null, !dbg !67
  br i1 %cmp, label %if.then1, label %if.end, !dbg !68

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #10, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !72
  %3 = load i8*, i8** %data.addr, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  br label %if.end2, !dbg !75

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data.addr, align 8, !dbg !76
  ret i8* %4, !dbg !77
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_21_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #9, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #9, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_21_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_21_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  %call3 = call i64 @strlen(i8* %arraydecay2) #8, !dbg !117
  %mul = mul i64 %call3, 1, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx4, align 1, !dbg !120
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @printLine(i8* %arraydecay5), !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !123
  call void @free(i8* %2) #9, !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !126 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  br label %if.end2, !dbg !134

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #9, !dbg !135
  store i8* %call, i8** %data.addr, align 8, !dbg !137
  %1 = load i8*, i8** %data.addr, align 8, !dbg !138
  %cmp = icmp eq i8* %1, null, !dbg !140
  br i1 %cmp, label %if.then1, label %if.end, !dbg !141

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #10, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !145
  %3 = load i8*, i8** %data.addr, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data.addr, align 8, !dbg !148
  ret i8* %4, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i8* null, i8** %data, align 8, !dbg !153
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !154
  %0 = load i8*, i8** %data, align 8, !dbg !155
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !156
  store i8* %call, i8** %data, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !158, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !161
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx, align 1, !dbg !163
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  %1 = load i8*, i8** %data, align 8, !dbg !165
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  %call3 = call i64 @strlen(i8* %arraydecay2) #8, !dbg !167
  %mul = mul i64 %call3, 1, !dbg !168
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !164
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !169
  store i8 0, i8* %arrayidx4, align 1, !dbg !170
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !171
  call void @printLine(i8* %arraydecay5), !dbg !172
  %2 = load i8*, i8** %data, align 8, !dbg !173
  call void @free(i8* %2) #9, !dbg !174
  ret void, !dbg !175
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !176 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !179
  %tobool = icmp ne i32 %0, 0, !dbg !179
  br i1 %tobool, label %if.then, label %if.end2, !dbg !181

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #9, !dbg !182
  store i8* %call, i8** %data.addr, align 8, !dbg !184
  %1 = load i8*, i8** %data.addr, align 8, !dbg !185
  %cmp = icmp eq i8* %1, null, !dbg !187
  br i1 %cmp, label %if.then1, label %if.end, !dbg !188

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #10, !dbg !189
  unreachable, !dbg !189

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !192
  %3 = load i8*, i8** %data.addr, align 8, !dbg !193
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !193
  store i8 0, i8* %arrayidx, align 1, !dbg !194
  br label %if.end2, !dbg !195

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data.addr, align 8, !dbg !196
  ret i8* %4, !dbg !197
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 63, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 64, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_21_bad", scope: !13, file: !13, line: 39, type: !24, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 41, type: !7)
!27 = !DILocation(line: 41, column: 12, scope: !23)
!28 = !DILocation(line: 42, column: 10, scope: !23)
!29 = !DILocation(line: 43, column: 15, scope: !23)
!30 = !DILocation(line: 44, column: 22, scope: !23)
!31 = !DILocation(line: 44, column: 12, scope: !23)
!32 = !DILocation(line: 44, column: 10, scope: !23)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !13, line: 46, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 45, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 46, column: 14, scope: !34)
!39 = !DILocation(line: 47, column: 9, scope: !34)
!40 = !DILocation(line: 48, column: 9, scope: !34)
!41 = !DILocation(line: 48, column: 21, scope: !34)
!42 = !DILocation(line: 51, column: 9, scope: !34)
!43 = !DILocation(line: 51, column: 22, scope: !34)
!44 = !DILocation(line: 51, column: 35, scope: !34)
!45 = !DILocation(line: 51, column: 28, scope: !34)
!46 = !DILocation(line: 51, column: 40, scope: !34)
!47 = !DILocation(line: 52, column: 9, scope: !34)
!48 = !DILocation(line: 52, column: 21, scope: !34)
!49 = !DILocation(line: 53, column: 19, scope: !34)
!50 = !DILocation(line: 53, column: 9, scope: !34)
!51 = !DILocation(line: 54, column: 14, scope: !34)
!52 = !DILocation(line: 54, column: 9, scope: !34)
!53 = !DILocation(line: 56, column: 1, scope: !23)
!54 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !13, line: 26, type: !7)
!58 = !DILocation(line: 26, column: 32, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !13, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocation(line: 31, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !13, line: 29, column: 5)
!64 = !DILocation(line: 31, column: 14, scope: !63)
!65 = !DILocation(line: 32, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !13, line: 32, column: 13)
!67 = !DILocation(line: 32, column: 18, scope: !66)
!68 = !DILocation(line: 32, column: 13, scope: !63)
!69 = !DILocation(line: 32, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !13, line: 32, column: 27)
!71 = !DILocation(line: 33, column: 16, scope: !63)
!72 = !DILocation(line: 33, column: 9, scope: !63)
!73 = !DILocation(line: 34, column: 9, scope: !63)
!74 = !DILocation(line: 34, column: 20, scope: !63)
!75 = !DILocation(line: 35, column: 5, scope: !63)
!76 = !DILocation(line: 36, column: 12, scope: !54)
!77 = !DILocation(line: 36, column: 5, scope: !54)
!78 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_21_good", scope: !13, file: !13, line: 137, type: !24, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 139, column: 5, scope: !78)
!80 = !DILocation(line: 140, column: 5, scope: !78)
!81 = !DILocation(line: 141, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 153, type: !83, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!14, !14, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !13, line: 153, type: !14)
!87 = !DILocation(line: 153, column: 14, scope: !82)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !13, line: 153, type: !85)
!89 = !DILocation(line: 153, column: 27, scope: !82)
!90 = !DILocation(line: 156, column: 22, scope: !82)
!91 = !DILocation(line: 156, column: 12, scope: !82)
!92 = !DILocation(line: 156, column: 5, scope: !82)
!93 = !DILocation(line: 158, column: 5, scope: !82)
!94 = !DILocation(line: 159, column: 5, scope: !82)
!95 = !DILocation(line: 160, column: 5, scope: !82)
!96 = !DILocation(line: 163, column: 5, scope: !82)
!97 = !DILocation(line: 164, column: 5, scope: !82)
!98 = !DILocation(line: 165, column: 5, scope: !82)
!99 = !DILocation(line: 167, column: 5, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 85, type: !24, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !13, line: 87, type: !7)
!102 = !DILocation(line: 87, column: 12, scope: !100)
!103 = !DILocation(line: 88, column: 10, scope: !100)
!104 = !DILocation(line: 89, column: 20, scope: !100)
!105 = !DILocation(line: 90, column: 27, scope: !100)
!106 = !DILocation(line: 90, column: 12, scope: !100)
!107 = !DILocation(line: 90, column: 10, scope: !100)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !13, line: 92, type: !35)
!109 = distinct !DILexicalBlock(scope: !100, file: !13, line: 91, column: 5)
!110 = !DILocation(line: 92, column: 14, scope: !109)
!111 = !DILocation(line: 93, column: 9, scope: !109)
!112 = !DILocation(line: 94, column: 9, scope: !109)
!113 = !DILocation(line: 94, column: 21, scope: !109)
!114 = !DILocation(line: 97, column: 9, scope: !109)
!115 = !DILocation(line: 97, column: 22, scope: !109)
!116 = !DILocation(line: 97, column: 35, scope: !109)
!117 = !DILocation(line: 97, column: 28, scope: !109)
!118 = !DILocation(line: 97, column: 40, scope: !109)
!119 = !DILocation(line: 98, column: 9, scope: !109)
!120 = !DILocation(line: 98, column: 21, scope: !109)
!121 = !DILocation(line: 99, column: 19, scope: !109)
!122 = !DILocation(line: 99, column: 9, scope: !109)
!123 = !DILocation(line: 100, column: 14, scope: !109)
!124 = !DILocation(line: 100, column: 9, scope: !109)
!125 = !DILocation(line: 102, column: 1, scope: !100)
!126 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 67, type: !55, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !13, line: 67, type: !7)
!128 = !DILocation(line: 67, column: 37, scope: !126)
!129 = !DILocation(line: 69, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !13, line: 69, column: 8)
!131 = !DILocation(line: 69, column: 8, scope: !126)
!132 = !DILocation(line: 72, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !13, line: 70, column: 5)
!134 = !DILocation(line: 73, column: 5, scope: !133)
!135 = !DILocation(line: 77, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !13, line: 75, column: 5)
!137 = !DILocation(line: 77, column: 14, scope: !136)
!138 = !DILocation(line: 78, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !13, line: 78, column: 13)
!140 = !DILocation(line: 78, column: 18, scope: !139)
!141 = !DILocation(line: 78, column: 13, scope: !136)
!142 = !DILocation(line: 78, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !13, line: 78, column: 27)
!144 = !DILocation(line: 79, column: 16, scope: !136)
!145 = !DILocation(line: 79, column: 9, scope: !136)
!146 = !DILocation(line: 80, column: 9, scope: !136)
!147 = !DILocation(line: 80, column: 21, scope: !136)
!148 = !DILocation(line: 82, column: 12, scope: !126)
!149 = !DILocation(line: 82, column: 5, scope: !126)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 118, type: !24, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", scope: !150, file: !13, line: 120, type: !7)
!152 = !DILocation(line: 120, column: 12, scope: !150)
!153 = !DILocation(line: 121, column: 10, scope: !150)
!154 = !DILocation(line: 122, column: 20, scope: !150)
!155 = !DILocation(line: 123, column: 27, scope: !150)
!156 = !DILocation(line: 123, column: 12, scope: !150)
!157 = !DILocation(line: 123, column: 10, scope: !150)
!158 = !DILocalVariable(name: "dest", scope: !159, file: !13, line: 125, type: !35)
!159 = distinct !DILexicalBlock(scope: !150, file: !13, line: 124, column: 5)
!160 = !DILocation(line: 125, column: 14, scope: !159)
!161 = !DILocation(line: 126, column: 9, scope: !159)
!162 = !DILocation(line: 127, column: 9, scope: !159)
!163 = !DILocation(line: 127, column: 21, scope: !159)
!164 = !DILocation(line: 130, column: 9, scope: !159)
!165 = !DILocation(line: 130, column: 22, scope: !159)
!166 = !DILocation(line: 130, column: 35, scope: !159)
!167 = !DILocation(line: 130, column: 28, scope: !159)
!168 = !DILocation(line: 130, column: 40, scope: !159)
!169 = !DILocation(line: 131, column: 9, scope: !159)
!170 = !DILocation(line: 131, column: 21, scope: !159)
!171 = !DILocation(line: 132, column: 19, scope: !159)
!172 = !DILocation(line: 132, column: 9, scope: !159)
!173 = !DILocation(line: 133, column: 14, scope: !159)
!174 = !DILocation(line: 133, column: 9, scope: !159)
!175 = !DILocation(line: 135, column: 1, scope: !150)
!176 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 105, type: !55, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DILocalVariable(name: "data", arg: 1, scope: !176, file: !13, line: 105, type: !7)
!178 = !DILocation(line: 105, column: 37, scope: !176)
!179 = !DILocation(line: 107, column: 8, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !13, line: 107, column: 8)
!181 = !DILocation(line: 107, column: 8, scope: !176)
!182 = !DILocation(line: 110, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !13, line: 108, column: 5)
!184 = !DILocation(line: 110, column: 14, scope: !183)
!185 = !DILocation(line: 111, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !13, line: 111, column: 13)
!187 = !DILocation(line: 111, column: 18, scope: !186)
!188 = !DILocation(line: 111, column: 13, scope: !183)
!189 = !DILocation(line: 111, column: 28, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !13, line: 111, column: 27)
!191 = !DILocation(line: 112, column: 16, scope: !183)
!192 = !DILocation(line: 112, column: 9, scope: !183)
!193 = !DILocation(line: 113, column: 9, scope: !183)
!194 = !DILocation(line: 113, column: 21, scope: !183)
!195 = !DILocation(line: 114, column: 5, scope: !183)
!196 = !DILocation(line: 115, column: 12, scope: !176)
!197 = !DILocation(line: 115, column: 5, scope: !176)
