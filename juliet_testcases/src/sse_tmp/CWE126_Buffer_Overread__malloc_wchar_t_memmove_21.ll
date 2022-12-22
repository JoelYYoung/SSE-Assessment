; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !44
  %2 = load i32*, i32** %data, align 8, !dbg !45
  %3 = bitcast i32* %2 to i8*, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call4 = call i64 @wcslen(i32* %arraydecay3) #8, !dbg !47
  %mul = mul i64 %call4, 4, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !44
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx5, align 4, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  call void @printWLine(i32* %arraydecay6), !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  %5 = bitcast i32* %4 to i8*, !dbg !53
  call void @free(i8* %5) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @badStatic, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end3, !dbg !63

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !64
  %1 = bitcast i8* %call to i32*, !dbg !66
  store i32* %1, i32** %data.addr, align 8, !dbg !67
  %2 = load i32*, i32** %data.addr, align 8, !dbg !68
  %cmp = icmp eq i32* %2, null, !dbg !70
  br i1 %cmp, label %if.then1, label %if.end, !dbg !71

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !74
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !75
  %4 = load i32*, i32** %data.addr, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  br label %if.end3, !dbg !78

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data.addr, align 8, !dbg !79
  ret i32* %5, !dbg !80
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_21_good() #0 !dbg !81 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_21_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_21_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !111
  store i32* %call, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %3 = bitcast i32* %2 to i8*, !dbg !120
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call4 = call i64 @wcslen(i32* %arraydecay3) #8, !dbg !123
  %mul = mul i64 %call4, 4, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !120
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx5, align 4, !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay6), !dbg !128
  %4 = load i32*, i32** %data, align 8, !dbg !129
  %5 = bitcast i32* %4 to i8*, !dbg !129
  call void @free(i8* %5) #7, !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !132 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !135
  %tobool = icmp ne i32 %0, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !138
  br label %if.end3, !dbg !140

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !141
  %1 = bitcast i8* %call to i32*, !dbg !143
  store i32* %1, i32** %data.addr, align 8, !dbg !144
  %2 = load i32*, i32** %data.addr, align 8, !dbg !145
  %cmp = icmp eq i32* %2, null, !dbg !147
  br i1 %cmp, label %if.then1, label %if.end, !dbg !148

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !149
  unreachable, !dbg !149

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !151
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !152
  %4 = load i32*, i32** %data.addr, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !153
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data.addr, align 8, !dbg !155
  ret i32* %5, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !158, metadata !DIExpression()), !dbg !159
  store i32* null, i32** %data, align 8, !dbg !160
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !161
  %0 = load i32*, i32** %data, align 8, !dbg !162
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !163
  store i32* %call, i32** %data, align 8, !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !165, metadata !DIExpression()), !dbg !167
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !169
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx, align 4, !dbg !171
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !172
  %2 = load i32*, i32** %data, align 8, !dbg !173
  %3 = bitcast i32* %2 to i8*, !dbg !172
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %call4 = call i64 @wcslen(i32* %arraydecay3) #8, !dbg !175
  %mul = mul i64 %call4, 4, !dbg !176
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !172
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx5, align 4, !dbg !178
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !179
  call void @printWLine(i32* %arraydecay6), !dbg !180
  %4 = load i32*, i32** %data, align 8, !dbg !181
  %5 = bitcast i32* %4 to i8*, !dbg !181
  call void @free(i8* %5) #7, !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !184 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !185, metadata !DIExpression()), !dbg !186
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !187
  %tobool = icmp ne i32 %0, 0, !dbg !187
  br i1 %tobool, label %if.then, label %if.end3, !dbg !189

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !190
  %1 = bitcast i8* %call to i32*, !dbg !192
  store i32* %1, i32** %data.addr, align 8, !dbg !193
  %2 = load i32*, i32** %data.addr, align 8, !dbg !194
  %cmp = icmp eq i32* %2, null, !dbg !196
  br i1 %cmp, label %if.then1, label %if.end, !dbg !197

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !198
  unreachable, !dbg !198

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !200
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !201
  %4 = load i32*, i32** %data.addr, align 8, !dbg !202
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !202
  store i32 0, i32* %arrayidx, align 4, !dbg !203
  br label %if.end3, !dbg !204

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data.addr, align 8, !dbg !205
  ret i32* %5, !dbg !206
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 63, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 64, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_21_bad", scope: !15, file: !15, line: 39, type: !25, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 41, type: !7)
!28 = !DILocation(line: 41, column: 15, scope: !24)
!29 = !DILocation(line: 42, column: 10, scope: !24)
!30 = !DILocation(line: 43, column: 15, scope: !24)
!31 = !DILocation(line: 44, column: 22, scope: !24)
!32 = !DILocation(line: 44, column: 12, scope: !24)
!33 = !DILocation(line: 44, column: 10, scope: !24)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 46, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 45, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 46, column: 17, scope: !35)
!40 = !DILocation(line: 47, column: 17, scope: !35)
!41 = !DILocation(line: 47, column: 9, scope: !35)
!42 = !DILocation(line: 48, column: 9, scope: !35)
!43 = !DILocation(line: 48, column: 21, scope: !35)
!44 = !DILocation(line: 51, column: 9, scope: !35)
!45 = !DILocation(line: 51, column: 23, scope: !35)
!46 = !DILocation(line: 51, column: 36, scope: !35)
!47 = !DILocation(line: 51, column: 29, scope: !35)
!48 = !DILocation(line: 51, column: 41, scope: !35)
!49 = !DILocation(line: 52, column: 9, scope: !35)
!50 = !DILocation(line: 52, column: 21, scope: !35)
!51 = !DILocation(line: 53, column: 20, scope: !35)
!52 = !DILocation(line: 53, column: 9, scope: !35)
!53 = !DILocation(line: 54, column: 14, scope: !35)
!54 = !DILocation(line: 54, column: 9, scope: !35)
!55 = !DILocation(line: 56, column: 1, scope: !24)
!56 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !57, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7}
!59 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !15, line: 26, type: !7)
!60 = !DILocation(line: 26, column: 38, scope: !56)
!61 = !DILocation(line: 28, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !15, line: 28, column: 8)
!63 = !DILocation(line: 28, column: 8, scope: !56)
!64 = !DILocation(line: 31, column: 27, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 29, column: 5)
!66 = !DILocation(line: 31, column: 16, scope: !65)
!67 = !DILocation(line: 31, column: 14, scope: !65)
!68 = !DILocation(line: 32, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 32, column: 13)
!70 = !DILocation(line: 32, column: 18, scope: !69)
!71 = !DILocation(line: 32, column: 13, scope: !65)
!72 = !DILocation(line: 32, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 32, column: 27)
!74 = !DILocation(line: 33, column: 17, scope: !65)
!75 = !DILocation(line: 33, column: 9, scope: !65)
!76 = !DILocation(line: 34, column: 9, scope: !65)
!77 = !DILocation(line: 34, column: 20, scope: !65)
!78 = !DILocation(line: 35, column: 5, scope: !65)
!79 = !DILocation(line: 36, column: 12, scope: !56)
!80 = !DILocation(line: 36, column: 5, scope: !56)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_21_good", scope: !15, file: !15, line: 137, type: !25, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 139, column: 5, scope: !81)
!83 = !DILocation(line: 140, column: 5, scope: !81)
!84 = !DILocation(line: 141, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 153, type: !86, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!10, !10, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 153, type: !10)
!92 = !DILocation(line: 153, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 153, type: !88)
!94 = !DILocation(line: 153, column: 27, scope: !85)
!95 = !DILocation(line: 156, column: 22, scope: !85)
!96 = !DILocation(line: 156, column: 12, scope: !85)
!97 = !DILocation(line: 156, column: 5, scope: !85)
!98 = !DILocation(line: 158, column: 5, scope: !85)
!99 = !DILocation(line: 159, column: 5, scope: !85)
!100 = !DILocation(line: 160, column: 5, scope: !85)
!101 = !DILocation(line: 163, column: 5, scope: !85)
!102 = !DILocation(line: 164, column: 5, scope: !85)
!103 = !DILocation(line: 165, column: 5, scope: !85)
!104 = !DILocation(line: 167, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 85, type: !25, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 87, type: !7)
!107 = !DILocation(line: 87, column: 15, scope: !105)
!108 = !DILocation(line: 88, column: 10, scope: !105)
!109 = !DILocation(line: 89, column: 20, scope: !105)
!110 = !DILocation(line: 90, column: 27, scope: !105)
!111 = !DILocation(line: 90, column: 12, scope: !105)
!112 = !DILocation(line: 90, column: 10, scope: !105)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !15, line: 92, type: !36)
!114 = distinct !DILexicalBlock(scope: !105, file: !15, line: 91, column: 5)
!115 = !DILocation(line: 92, column: 17, scope: !114)
!116 = !DILocation(line: 93, column: 17, scope: !114)
!117 = !DILocation(line: 93, column: 9, scope: !114)
!118 = !DILocation(line: 94, column: 9, scope: !114)
!119 = !DILocation(line: 94, column: 21, scope: !114)
!120 = !DILocation(line: 97, column: 9, scope: !114)
!121 = !DILocation(line: 97, column: 23, scope: !114)
!122 = !DILocation(line: 97, column: 36, scope: !114)
!123 = !DILocation(line: 97, column: 29, scope: !114)
!124 = !DILocation(line: 97, column: 41, scope: !114)
!125 = !DILocation(line: 98, column: 9, scope: !114)
!126 = !DILocation(line: 98, column: 21, scope: !114)
!127 = !DILocation(line: 99, column: 20, scope: !114)
!128 = !DILocation(line: 99, column: 9, scope: !114)
!129 = !DILocation(line: 100, column: 14, scope: !114)
!130 = !DILocation(line: 100, column: 9, scope: !114)
!131 = !DILocation(line: 102, column: 1, scope: !105)
!132 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 67, type: !57, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", arg: 1, scope: !132, file: !15, line: 67, type: !7)
!134 = !DILocation(line: 67, column: 43, scope: !132)
!135 = !DILocation(line: 69, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 69, column: 8)
!137 = !DILocation(line: 69, column: 8, scope: !132)
!138 = !DILocation(line: 72, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 70, column: 5)
!140 = !DILocation(line: 73, column: 5, scope: !139)
!141 = !DILocation(line: 77, column: 27, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !15, line: 75, column: 5)
!143 = !DILocation(line: 77, column: 16, scope: !142)
!144 = !DILocation(line: 77, column: 14, scope: !142)
!145 = !DILocation(line: 78, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 78, column: 13)
!147 = !DILocation(line: 78, column: 18, scope: !146)
!148 = !DILocation(line: 78, column: 13, scope: !142)
!149 = !DILocation(line: 78, column: 28, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 78, column: 27)
!151 = !DILocation(line: 79, column: 17, scope: !142)
!152 = !DILocation(line: 79, column: 9, scope: !142)
!153 = !DILocation(line: 80, column: 9, scope: !142)
!154 = !DILocation(line: 80, column: 21, scope: !142)
!155 = !DILocation(line: 82, column: 12, scope: !132)
!156 = !DILocation(line: 82, column: 5, scope: !132)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 118, type: !25, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!158 = !DILocalVariable(name: "data", scope: !157, file: !15, line: 120, type: !7)
!159 = !DILocation(line: 120, column: 15, scope: !157)
!160 = !DILocation(line: 121, column: 10, scope: !157)
!161 = !DILocation(line: 122, column: 20, scope: !157)
!162 = !DILocation(line: 123, column: 27, scope: !157)
!163 = !DILocation(line: 123, column: 12, scope: !157)
!164 = !DILocation(line: 123, column: 10, scope: !157)
!165 = !DILocalVariable(name: "dest", scope: !166, file: !15, line: 125, type: !36)
!166 = distinct !DILexicalBlock(scope: !157, file: !15, line: 124, column: 5)
!167 = !DILocation(line: 125, column: 17, scope: !166)
!168 = !DILocation(line: 126, column: 17, scope: !166)
!169 = !DILocation(line: 126, column: 9, scope: !166)
!170 = !DILocation(line: 127, column: 9, scope: !166)
!171 = !DILocation(line: 127, column: 21, scope: !166)
!172 = !DILocation(line: 130, column: 9, scope: !166)
!173 = !DILocation(line: 130, column: 23, scope: !166)
!174 = !DILocation(line: 130, column: 36, scope: !166)
!175 = !DILocation(line: 130, column: 29, scope: !166)
!176 = !DILocation(line: 130, column: 41, scope: !166)
!177 = !DILocation(line: 131, column: 9, scope: !166)
!178 = !DILocation(line: 131, column: 21, scope: !166)
!179 = !DILocation(line: 132, column: 20, scope: !166)
!180 = !DILocation(line: 132, column: 9, scope: !166)
!181 = !DILocation(line: 133, column: 14, scope: !166)
!182 = !DILocation(line: 133, column: 9, scope: !166)
!183 = !DILocation(line: 135, column: 1, scope: !157)
!184 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 105, type: !57, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!185 = !DILocalVariable(name: "data", arg: 1, scope: !184, file: !15, line: 105, type: !7)
!186 = !DILocation(line: 105, column: 43, scope: !184)
!187 = !DILocation(line: 107, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !15, line: 107, column: 8)
!189 = !DILocation(line: 107, column: 8, scope: !184)
!190 = !DILocation(line: 110, column: 27, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !15, line: 108, column: 5)
!192 = !DILocation(line: 110, column: 16, scope: !191)
!193 = !DILocation(line: 110, column: 14, scope: !191)
!194 = !DILocation(line: 111, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 111, column: 13)
!196 = !DILocation(line: 111, column: 18, scope: !195)
!197 = !DILocation(line: 111, column: 13, scope: !191)
!198 = !DILocation(line: 111, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !15, line: 111, column: 27)
!200 = !DILocation(line: 112, column: 17, scope: !191)
!201 = !DILocation(line: 112, column: 9, scope: !191)
!202 = !DILocation(line: 113, column: 9, scope: !191)
!203 = !DILocation(line: 113, column: 21, scope: !191)
!204 = !DILocation(line: 114, column: 5, scope: !191)
!205 = !DILocation(line: 115, column: 12, scope: !184)
!206 = !DILocation(line: 115, column: 5, scope: !184)
