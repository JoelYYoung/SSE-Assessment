; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end4, !dbg !44

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !58
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx6, align 4, !dbg !60
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !62
  store i64 %call8, i64* %destLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !67
  %6 = load i64, i64* %destLen, align 8, !dbg !69
  %cmp9 = icmp ult i64 %5, %6, !dbg !70
  br i1 %cmp9, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !72
  %8 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx10 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !72
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !72
  %10 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !76
  store i32 %9, i32* %arrayidx11, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %11, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx12, align 4, !dbg !85
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  call void @printWLine(i32* %arraydecay13), !dbg !87
  %12 = load i32*, i32** %data, align 8, !dbg !88
  %13 = bitcast i32* %12 to i8*, !dbg !88
  call void @free(i8* %13) #6, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_07_good() #0 !dbg !91 {
entry:
  call void @goodG2B1(), !dbg !92
  call void @goodG2B2(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #6, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #6, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_07_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_07_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32* null, i32** %data, align 8, !dbg !118
  %0 = load i32, i32* @staticFive, align 4, !dbg !119
  %cmp = icmp ne i32 %0, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.else, !dbg !122

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !123
  br label %if.end4, !dbg !125

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !126
  %1 = bitcast i8* %call to i32*, !dbg !128
  store i32* %1, i32** %data, align 8, !dbg !129
  %2 = load i32*, i32** %data, align 8, !dbg !130
  %cmp1 = icmp eq i32* %2, null, !dbg !132
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !133

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !137
  %4 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !148
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx6, align 4, !dbg !150
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !152
  store i64 %call8, i64* %destLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !157
  %6 = load i64, i64* %destLen, align 8, !dbg !159
  %cmp9 = icmp ult i64 %5, %6, !dbg !160
  br i1 %cmp9, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !162
  %8 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx10 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !162
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !162
  %10 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !166
  store i32 %9, i32* %arrayidx11, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %11, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx12, align 4, !dbg !174
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay13), !dbg !176
  %12 = load i32*, i32** %data, align 8, !dbg !177
  %13 = bitcast i32* %12 to i8*, !dbg !177
  call void @free(i8* %13) #6, !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i32* null, i32** %data, align 8, !dbg !183
  %0 = load i32, i32* @staticFive, align 4, !dbg !184
  %cmp = icmp eq i32 %0, 5, !dbg !186
  br i1 %cmp, label %if.then, label %if.end4, !dbg !187

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !188
  %1 = bitcast i8* %call to i32*, !dbg !190
  store i32* %1, i32** %data, align 8, !dbg !191
  %2 = load i32*, i32** %data, align 8, !dbg !192
  %cmp1 = icmp eq i32* %2, null, !dbg !194
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !195

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !196
  unreachable, !dbg !196

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !198
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !199
  %4 = load i32*, i32** %data, align 8, !dbg !200
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !200
  store i32 0, i32* %arrayidx, align 4, !dbg !201
  br label %if.end4, !dbg !202

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !203, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !206, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !208, metadata !DIExpression()), !dbg !209
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !210
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !211
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !212
  store i32 0, i32* %arrayidx6, align 4, !dbg !213
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !214
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !215
  store i64 %call8, i64* %destLen, align 8, !dbg !216
  store i64 0, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !219

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !220
  %6 = load i64, i64* %destLen, align 8, !dbg !222
  %cmp9 = icmp ult i64 %5, %6, !dbg !223
  br i1 %cmp9, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !225
  %8 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx10 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !225
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !225
  %10 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !229
  store i32 %9, i32* %arrayidx11, align 4, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !232
  %inc = add i64 %11, 1, !dbg !232
  store i64 %inc, i64* %i, align 8, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !236
  store i32 0, i32* %arrayidx12, align 4, !dbg !237
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !238
  call void @printWLine(i32* %arraydecay13), !dbg !239
  %12 = load i32*, i32** %data, align 8, !dbg !240
  %13 = bitcast i32* %12 to i8*, !dbg !240
  call void @free(i8* %13) #6, !dbg !241
  ret void, !dbg !242
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocation(line: 36, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 14, scope: !31)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !31)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 17, scope: !31)
!41 = !DILocation(line: 38, column: 9, scope: !31)
!42 = !DILocation(line: 39, column: 9, scope: !31)
!43 = !DILocation(line: 39, column: 20, scope: !31)
!44 = !DILocation(line: 40, column: 5, scope: !31)
!45 = !DILocalVariable(name: "i", scope: !46, file: !13, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !20, file: !13, line: 41, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 16, scope: !46)
!50 = !DILocalVariable(name: "destLen", scope: !46, file: !13, line: 42, type: !47)
!51 = !DILocation(line: 42, column: 19, scope: !46)
!52 = !DILocalVariable(name: "dest", scope: !46, file: !13, line: 43, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 43, column: 17, scope: !46)
!57 = !DILocation(line: 44, column: 17, scope: !46)
!58 = !DILocation(line: 44, column: 9, scope: !46)
!59 = !DILocation(line: 45, column: 9, scope: !46)
!60 = !DILocation(line: 45, column: 21, scope: !46)
!61 = !DILocation(line: 46, column: 26, scope: !46)
!62 = !DILocation(line: 46, column: 19, scope: !46)
!63 = !DILocation(line: 46, column: 17, scope: !46)
!64 = !DILocation(line: 49, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !46, file: !13, line: 49, column: 9)
!66 = !DILocation(line: 49, column: 14, scope: !65)
!67 = !DILocation(line: 49, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !13, line: 49, column: 9)
!69 = !DILocation(line: 49, column: 25, scope: !68)
!70 = !DILocation(line: 49, column: 23, scope: !68)
!71 = !DILocation(line: 49, column: 9, scope: !65)
!72 = !DILocation(line: 51, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !13, line: 50, column: 9)
!74 = !DILocation(line: 51, column: 28, scope: !73)
!75 = !DILocation(line: 51, column: 18, scope: !73)
!76 = !DILocation(line: 51, column: 13, scope: !73)
!77 = !DILocation(line: 51, column: 21, scope: !73)
!78 = !DILocation(line: 52, column: 9, scope: !73)
!79 = !DILocation(line: 49, column: 35, scope: !68)
!80 = !DILocation(line: 49, column: 9, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 52, column: 9, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 53, column: 9, scope: !46)
!85 = !DILocation(line: 53, column: 21, scope: !46)
!86 = !DILocation(line: 54, column: 20, scope: !46)
!87 = !DILocation(line: 54, column: 9, scope: !46)
!88 = !DILocation(line: 55, column: 14, scope: !46)
!89 = !DILocation(line: 55, column: 9, scope: !46)
!90 = !DILocation(line: 57, column: 1, scope: !20)
!91 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_07_good", scope: !13, file: !13, line: 130, type: !21, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocation(line: 132, column: 5, scope: !91)
!93 = !DILocation(line: 133, column: 5, scope: !91)
!94 = !DILocation(line: 134, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 146, type: !96, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DISubroutineType(types: !97)
!97 = !{!9, !9, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !13, line: 146, type: !9)
!102 = !DILocation(line: 146, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !13, line: 146, type: !98)
!104 = !DILocation(line: 146, column: 27, scope: !95)
!105 = !DILocation(line: 149, column: 22, scope: !95)
!106 = !DILocation(line: 149, column: 12, scope: !95)
!107 = !DILocation(line: 149, column: 5, scope: !95)
!108 = !DILocation(line: 151, column: 5, scope: !95)
!109 = !DILocation(line: 152, column: 5, scope: !95)
!110 = !DILocation(line: 153, column: 5, scope: !95)
!111 = !DILocation(line: 156, column: 5, scope: !95)
!112 = !DILocation(line: 157, column: 5, scope: !95)
!113 = !DILocation(line: 158, column: 5, scope: !95)
!114 = !DILocation(line: 160, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !13, line: 66, type: !6)
!117 = !DILocation(line: 66, column: 15, scope: !115)
!118 = !DILocation(line: 67, column: 10, scope: !115)
!119 = !DILocation(line: 68, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !13, line: 68, column: 8)
!121 = !DILocation(line: 68, column: 18, scope: !120)
!122 = !DILocation(line: 68, column: 8, scope: !115)
!123 = !DILocation(line: 71, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !13, line: 69, column: 5)
!125 = !DILocation(line: 72, column: 5, scope: !124)
!126 = !DILocation(line: 76, column: 27, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !13, line: 74, column: 5)
!128 = !DILocation(line: 76, column: 16, scope: !127)
!129 = !DILocation(line: 76, column: 14, scope: !127)
!130 = !DILocation(line: 77, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !13, line: 77, column: 13)
!132 = !DILocation(line: 77, column: 18, scope: !131)
!133 = !DILocation(line: 77, column: 13, scope: !127)
!134 = !DILocation(line: 77, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !13, line: 77, column: 27)
!136 = !DILocation(line: 78, column: 17, scope: !127)
!137 = !DILocation(line: 78, column: 9, scope: !127)
!138 = !DILocation(line: 79, column: 9, scope: !127)
!139 = !DILocation(line: 79, column: 21, scope: !127)
!140 = !DILocalVariable(name: "i", scope: !141, file: !13, line: 82, type: !47)
!141 = distinct !DILexicalBlock(scope: !115, file: !13, line: 81, column: 5)
!142 = !DILocation(line: 82, column: 16, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !13, line: 82, type: !47)
!144 = !DILocation(line: 82, column: 19, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !13, line: 83, type: !53)
!146 = !DILocation(line: 83, column: 17, scope: !141)
!147 = !DILocation(line: 84, column: 17, scope: !141)
!148 = !DILocation(line: 84, column: 9, scope: !141)
!149 = !DILocation(line: 85, column: 9, scope: !141)
!150 = !DILocation(line: 85, column: 21, scope: !141)
!151 = !DILocation(line: 86, column: 26, scope: !141)
!152 = !DILocation(line: 86, column: 19, scope: !141)
!153 = !DILocation(line: 86, column: 17, scope: !141)
!154 = !DILocation(line: 89, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !13, line: 89, column: 9)
!156 = !DILocation(line: 89, column: 14, scope: !155)
!157 = !DILocation(line: 89, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !13, line: 89, column: 9)
!159 = !DILocation(line: 89, column: 25, scope: !158)
!160 = !DILocation(line: 89, column: 23, scope: !158)
!161 = !DILocation(line: 89, column: 9, scope: !155)
!162 = !DILocation(line: 91, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !13, line: 90, column: 9)
!164 = !DILocation(line: 91, column: 28, scope: !163)
!165 = !DILocation(line: 91, column: 18, scope: !163)
!166 = !DILocation(line: 91, column: 13, scope: !163)
!167 = !DILocation(line: 91, column: 21, scope: !163)
!168 = !DILocation(line: 92, column: 9, scope: !163)
!169 = !DILocation(line: 89, column: 35, scope: !158)
!170 = !DILocation(line: 89, column: 9, scope: !158)
!171 = distinct !{!171, !161, !172, !83}
!172 = !DILocation(line: 92, column: 9, scope: !155)
!173 = !DILocation(line: 93, column: 9, scope: !141)
!174 = !DILocation(line: 93, column: 21, scope: !141)
!175 = !DILocation(line: 94, column: 20, scope: !141)
!176 = !DILocation(line: 94, column: 9, scope: !141)
!177 = !DILocation(line: 95, column: 14, scope: !141)
!178 = !DILocation(line: 95, column: 9, scope: !141)
!179 = !DILocation(line: 97, column: 1, scope: !115)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 100, type: !21, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocalVariable(name: "data", scope: !180, file: !13, line: 102, type: !6)
!182 = !DILocation(line: 102, column: 15, scope: !180)
!183 = !DILocation(line: 103, column: 10, scope: !180)
!184 = !DILocation(line: 104, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !13, line: 104, column: 8)
!186 = !DILocation(line: 104, column: 18, scope: !185)
!187 = !DILocation(line: 104, column: 8, scope: !180)
!188 = !DILocation(line: 107, column: 27, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 105, column: 5)
!190 = !DILocation(line: 107, column: 16, scope: !189)
!191 = !DILocation(line: 107, column: 14, scope: !189)
!192 = !DILocation(line: 108, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !13, line: 108, column: 13)
!194 = !DILocation(line: 108, column: 18, scope: !193)
!195 = !DILocation(line: 108, column: 13, scope: !189)
!196 = !DILocation(line: 108, column: 28, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !13, line: 108, column: 27)
!198 = !DILocation(line: 109, column: 17, scope: !189)
!199 = !DILocation(line: 109, column: 9, scope: !189)
!200 = !DILocation(line: 110, column: 9, scope: !189)
!201 = !DILocation(line: 110, column: 21, scope: !189)
!202 = !DILocation(line: 111, column: 5, scope: !189)
!203 = !DILocalVariable(name: "i", scope: !204, file: !13, line: 113, type: !47)
!204 = distinct !DILexicalBlock(scope: !180, file: !13, line: 112, column: 5)
!205 = !DILocation(line: 113, column: 16, scope: !204)
!206 = !DILocalVariable(name: "destLen", scope: !204, file: !13, line: 113, type: !47)
!207 = !DILocation(line: 113, column: 19, scope: !204)
!208 = !DILocalVariable(name: "dest", scope: !204, file: !13, line: 114, type: !53)
!209 = !DILocation(line: 114, column: 17, scope: !204)
!210 = !DILocation(line: 115, column: 17, scope: !204)
!211 = !DILocation(line: 115, column: 9, scope: !204)
!212 = !DILocation(line: 116, column: 9, scope: !204)
!213 = !DILocation(line: 116, column: 21, scope: !204)
!214 = !DILocation(line: 117, column: 26, scope: !204)
!215 = !DILocation(line: 117, column: 19, scope: !204)
!216 = !DILocation(line: 117, column: 17, scope: !204)
!217 = !DILocation(line: 120, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !204, file: !13, line: 120, column: 9)
!219 = !DILocation(line: 120, column: 14, scope: !218)
!220 = !DILocation(line: 120, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !13, line: 120, column: 9)
!222 = !DILocation(line: 120, column: 25, scope: !221)
!223 = !DILocation(line: 120, column: 23, scope: !221)
!224 = !DILocation(line: 120, column: 9, scope: !218)
!225 = !DILocation(line: 122, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !13, line: 121, column: 9)
!227 = !DILocation(line: 122, column: 28, scope: !226)
!228 = !DILocation(line: 122, column: 18, scope: !226)
!229 = !DILocation(line: 122, column: 13, scope: !226)
!230 = !DILocation(line: 122, column: 21, scope: !226)
!231 = !DILocation(line: 123, column: 9, scope: !226)
!232 = !DILocation(line: 120, column: 35, scope: !221)
!233 = !DILocation(line: 120, column: 9, scope: !221)
!234 = distinct !{!234, !224, !235, !83}
!235 = !DILocation(line: 123, column: 9, scope: !218)
!236 = !DILocation(line: 124, column: 9, scope: !204)
!237 = !DILocation(line: 124, column: 21, scope: !204)
!238 = !DILocation(line: 125, column: 20, scope: !204)
!239 = !DILocation(line: 125, column: 9, scope: !204)
!240 = !DILocation(line: 126, column: 14, scope: !204)
!241 = !DILocation(line: 126, column: 9, scope: !204)
!242 = !DILocation(line: 128, column: 1, scope: !180)
