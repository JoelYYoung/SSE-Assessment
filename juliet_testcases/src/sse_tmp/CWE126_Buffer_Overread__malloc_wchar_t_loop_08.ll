; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end4, !dbg !40

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx6, align 4, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !58
  store i64 %call8, i64* %destLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i64, i64* %i, align 8, !dbg !63
  %5 = load i64, i64* %destLen, align 8, !dbg !65
  %cmp9 = icmp ult i64 %4, %5, !dbg !66
  br i1 %cmp9, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !68
  %7 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx10 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !68
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !68
  %9 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !72
  store i32 %8, i32* %arrayidx11, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %10, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx12, align 4, !dbg !81
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  call void @printWLine(i32* %arraydecay13), !dbg !83
  %11 = load i32*, i32** %data, align 8, !dbg !84
  %12 = bitcast i32* %11 to i8*, !dbg !84
  call void @free(i8* %12) #6, !dbg !85
  ret void, !dbg !86
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_08_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #6, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #6, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_08_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_08_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !111 {
entry:
  ret i32 1, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32* null, i32** %data, align 8, !dbg !118
  %call = call i32 @staticReturnsFalse(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end4, !dbg !124

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !125
  %0 = bitcast i8* %call1 to i32*, !dbg !127
  store i32* %0, i32** %data, align 8, !dbg !128
  %1 = load i32*, i32** %data, align 8, !dbg !129
  %cmp = icmp eq i32* %1, null, !dbg !131
  br i1 %cmp, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !135
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !136
  %3 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !147
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx6, align 4, !dbg !149
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !151
  store i64 %call8, i64* %destLen, align 8, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i64, i64* %i, align 8, !dbg !156
  %5 = load i64, i64* %destLen, align 8, !dbg !158
  %cmp9 = icmp ult i64 %4, %5, !dbg !159
  br i1 %cmp9, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !161
  %7 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx10 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !161
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !161
  %9 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !165
  store i32 %8, i32* %arrayidx11, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %10, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !172
  store i32 0, i32* %arrayidx12, align 4, !dbg !173
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  call void @printWLine(i32* %arraydecay13), !dbg !175
  %11 = load i32*, i32** %data, align 8, !dbg !176
  %12 = bitcast i32* %11 to i8*, !dbg !176
  call void @free(i8* %12) #6, !dbg !177
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !179 {
entry:
  ret i32 0, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !181 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !182, metadata !DIExpression()), !dbg !183
  store i32* null, i32** %data, align 8, !dbg !184
  %call = call i32 @staticReturnsTrue(), !dbg !185
  %tobool = icmp ne i32 %call, 0, !dbg !185
  br i1 %tobool, label %if.then, label %if.end4, !dbg !187

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !188
  %0 = bitcast i8* %call1 to i32*, !dbg !190
  store i32* %0, i32** %data, align 8, !dbg !191
  %1 = load i32*, i32** %data, align 8, !dbg !192
  %cmp = icmp eq i32* %1, null, !dbg !194
  br i1 %cmp, label %if.then2, label %if.end, !dbg !195

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !196
  unreachable, !dbg !196

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !198
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !199
  %3 = load i32*, i32** %data, align 8, !dbg !200
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !200
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
  %4 = load i64, i64* %i, align 8, !dbg !220
  %5 = load i64, i64* %destLen, align 8, !dbg !222
  %cmp9 = icmp ult i64 %4, %5, !dbg !223
  br i1 %cmp9, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !225
  %7 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx10 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !225
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !225
  %9 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !229
  store i32 %8, i32* %arrayidx11, align 4, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !232
  %inc = add i64 %10, 1, !dbg !232
  store i64 %inc, i64* %i, align 8, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !236
  store i32 0, i32* %arrayidx12, align 4, !dbg !237
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !238
  call void @printWLine(i32* %arraydecay13), !dbg !239
  %11 = load i32*, i32** %data, align 8, !dbg !240
  %12 = bitcast i32* %11 to i8*, !dbg !240
  call void @free(i8* %12) #6, !dbg !241
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocation(line: 44, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!28 = !DILocation(line: 44, column: 16, scope: !27)
!29 = !DILocation(line: 44, column: 14, scope: !27)
!30 = !DILocation(line: 45, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 13)
!32 = !DILocation(line: 45, column: 18, scope: !31)
!33 = !DILocation(line: 45, column: 13, scope: !27)
!34 = !DILocation(line: 45, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 45, column: 27)
!36 = !DILocation(line: 46, column: 17, scope: !27)
!37 = !DILocation(line: 46, column: 9, scope: !27)
!38 = !DILocation(line: 47, column: 9, scope: !27)
!39 = !DILocation(line: 47, column: 20, scope: !27)
!40 = !DILocation(line: 48, column: 5, scope: !27)
!41 = !DILocalVariable(name: "i", scope: !42, file: !17, line: 50, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 50, column: 16, scope: !42)
!46 = !DILocalVariable(name: "destLen", scope: !42, file: !17, line: 50, type: !43)
!47 = !DILocation(line: 50, column: 19, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 51, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 51, column: 17, scope: !42)
!53 = !DILocation(line: 52, column: 17, scope: !42)
!54 = !DILocation(line: 52, column: 9, scope: !42)
!55 = !DILocation(line: 53, column: 9, scope: !42)
!56 = !DILocation(line: 53, column: 21, scope: !42)
!57 = !DILocation(line: 54, column: 26, scope: !42)
!58 = !DILocation(line: 54, column: 19, scope: !42)
!59 = !DILocation(line: 54, column: 17, scope: !42)
!60 = !DILocation(line: 57, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !42, file: !17, line: 57, column: 9)
!62 = !DILocation(line: 57, column: 14, scope: !61)
!63 = !DILocation(line: 57, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !17, line: 57, column: 9)
!65 = !DILocation(line: 57, column: 25, scope: !64)
!66 = !DILocation(line: 57, column: 23, scope: !64)
!67 = !DILocation(line: 57, column: 9, scope: !61)
!68 = !DILocation(line: 59, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !17, line: 58, column: 9)
!70 = !DILocation(line: 59, column: 28, scope: !69)
!71 = !DILocation(line: 59, column: 18, scope: !69)
!72 = !DILocation(line: 59, column: 13, scope: !69)
!73 = !DILocation(line: 59, column: 21, scope: !69)
!74 = !DILocation(line: 60, column: 9, scope: !69)
!75 = !DILocation(line: 57, column: 35, scope: !64)
!76 = !DILocation(line: 57, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 60, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 61, column: 9, scope: !42)
!81 = !DILocation(line: 61, column: 21, scope: !42)
!82 = !DILocation(line: 62, column: 20, scope: !42)
!83 = !DILocation(line: 62, column: 9, scope: !42)
!84 = !DILocation(line: 63, column: 14, scope: !42)
!85 = !DILocation(line: 63, column: 9, scope: !42)
!86 = !DILocation(line: 65, column: 1, scope: !16)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_08_good", scope: !17, file: !17, line: 138, type: !18, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 140, column: 5, scope: !87)
!89 = !DILocation(line: 141, column: 5, scope: !87)
!90 = !DILocation(line: 142, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 154, type: !92, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 154, type: !7)
!98 = !DILocation(line: 154, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 154, type: !94)
!100 = !DILocation(line: 154, column: 27, scope: !91)
!101 = !DILocation(line: 157, column: 22, scope: !91)
!102 = !DILocation(line: 157, column: 12, scope: !91)
!103 = !DILocation(line: 157, column: 5, scope: !91)
!104 = !DILocation(line: 159, column: 5, scope: !91)
!105 = !DILocation(line: 160, column: 5, scope: !91)
!106 = !DILocation(line: 161, column: 5, scope: !91)
!107 = !DILocation(line: 164, column: 5, scope: !91)
!108 = !DILocation(line: 165, column: 5, scope: !91)
!109 = !DILocation(line: 166, column: 5, scope: !91)
!110 = !DILocation(line: 168, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !112, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{!7}
!114 = !DILocation(line: 27, column: 5, scope: !111)
!115 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !17, line: 74, type: !4)
!117 = !DILocation(line: 74, column: 15, scope: !115)
!118 = !DILocation(line: 75, column: 10, scope: !115)
!119 = !DILocation(line: 76, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !17, line: 76, column: 8)
!121 = !DILocation(line: 76, column: 8, scope: !115)
!122 = !DILocation(line: 79, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !17, line: 77, column: 5)
!124 = !DILocation(line: 80, column: 5, scope: !123)
!125 = !DILocation(line: 84, column: 27, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !17, line: 82, column: 5)
!127 = !DILocation(line: 84, column: 16, scope: !126)
!128 = !DILocation(line: 84, column: 14, scope: !126)
!129 = !DILocation(line: 85, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 85, column: 13)
!131 = !DILocation(line: 85, column: 18, scope: !130)
!132 = !DILocation(line: 85, column: 13, scope: !126)
!133 = !DILocation(line: 85, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !17, line: 85, column: 27)
!135 = !DILocation(line: 86, column: 17, scope: !126)
!136 = !DILocation(line: 86, column: 9, scope: !126)
!137 = !DILocation(line: 87, column: 9, scope: !126)
!138 = !DILocation(line: 87, column: 21, scope: !126)
!139 = !DILocalVariable(name: "i", scope: !140, file: !17, line: 90, type: !43)
!140 = distinct !DILexicalBlock(scope: !115, file: !17, line: 89, column: 5)
!141 = !DILocation(line: 90, column: 16, scope: !140)
!142 = !DILocalVariable(name: "destLen", scope: !140, file: !17, line: 90, type: !43)
!143 = !DILocation(line: 90, column: 19, scope: !140)
!144 = !DILocalVariable(name: "dest", scope: !140, file: !17, line: 91, type: !49)
!145 = !DILocation(line: 91, column: 17, scope: !140)
!146 = !DILocation(line: 92, column: 17, scope: !140)
!147 = !DILocation(line: 92, column: 9, scope: !140)
!148 = !DILocation(line: 93, column: 9, scope: !140)
!149 = !DILocation(line: 93, column: 21, scope: !140)
!150 = !DILocation(line: 94, column: 26, scope: !140)
!151 = !DILocation(line: 94, column: 19, scope: !140)
!152 = !DILocation(line: 94, column: 17, scope: !140)
!153 = !DILocation(line: 97, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !140, file: !17, line: 97, column: 9)
!155 = !DILocation(line: 97, column: 14, scope: !154)
!156 = !DILocation(line: 97, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !17, line: 97, column: 9)
!158 = !DILocation(line: 97, column: 25, scope: !157)
!159 = !DILocation(line: 97, column: 23, scope: !157)
!160 = !DILocation(line: 97, column: 9, scope: !154)
!161 = !DILocation(line: 99, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !17, line: 98, column: 9)
!163 = !DILocation(line: 99, column: 28, scope: !162)
!164 = !DILocation(line: 99, column: 18, scope: !162)
!165 = !DILocation(line: 99, column: 13, scope: !162)
!166 = !DILocation(line: 99, column: 21, scope: !162)
!167 = !DILocation(line: 100, column: 9, scope: !162)
!168 = !DILocation(line: 97, column: 35, scope: !157)
!169 = !DILocation(line: 97, column: 9, scope: !157)
!170 = distinct !{!170, !160, !171, !79}
!171 = !DILocation(line: 100, column: 9, scope: !154)
!172 = !DILocation(line: 101, column: 9, scope: !140)
!173 = !DILocation(line: 101, column: 21, scope: !140)
!174 = !DILocation(line: 102, column: 20, scope: !140)
!175 = !DILocation(line: 102, column: 9, scope: !140)
!176 = !DILocation(line: 103, column: 14, scope: !140)
!177 = !DILocation(line: 103, column: 9, scope: !140)
!178 = !DILocation(line: 105, column: 1, scope: !115)
!179 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !112, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocation(line: 32, column: 5, scope: !179)
!181 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 108, type: !18, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!182 = !DILocalVariable(name: "data", scope: !181, file: !17, line: 110, type: !4)
!183 = !DILocation(line: 110, column: 15, scope: !181)
!184 = !DILocation(line: 111, column: 10, scope: !181)
!185 = !DILocation(line: 112, column: 8, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !17, line: 112, column: 8)
!187 = !DILocation(line: 112, column: 8, scope: !181)
!188 = !DILocation(line: 115, column: 27, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !17, line: 113, column: 5)
!190 = !DILocation(line: 115, column: 16, scope: !189)
!191 = !DILocation(line: 115, column: 14, scope: !189)
!192 = !DILocation(line: 116, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !17, line: 116, column: 13)
!194 = !DILocation(line: 116, column: 18, scope: !193)
!195 = !DILocation(line: 116, column: 13, scope: !189)
!196 = !DILocation(line: 116, column: 28, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !17, line: 116, column: 27)
!198 = !DILocation(line: 117, column: 17, scope: !189)
!199 = !DILocation(line: 117, column: 9, scope: !189)
!200 = !DILocation(line: 118, column: 9, scope: !189)
!201 = !DILocation(line: 118, column: 21, scope: !189)
!202 = !DILocation(line: 119, column: 5, scope: !189)
!203 = !DILocalVariable(name: "i", scope: !204, file: !17, line: 121, type: !43)
!204 = distinct !DILexicalBlock(scope: !181, file: !17, line: 120, column: 5)
!205 = !DILocation(line: 121, column: 16, scope: !204)
!206 = !DILocalVariable(name: "destLen", scope: !204, file: !17, line: 121, type: !43)
!207 = !DILocation(line: 121, column: 19, scope: !204)
!208 = !DILocalVariable(name: "dest", scope: !204, file: !17, line: 122, type: !49)
!209 = !DILocation(line: 122, column: 17, scope: !204)
!210 = !DILocation(line: 123, column: 17, scope: !204)
!211 = !DILocation(line: 123, column: 9, scope: !204)
!212 = !DILocation(line: 124, column: 9, scope: !204)
!213 = !DILocation(line: 124, column: 21, scope: !204)
!214 = !DILocation(line: 125, column: 26, scope: !204)
!215 = !DILocation(line: 125, column: 19, scope: !204)
!216 = !DILocation(line: 125, column: 17, scope: !204)
!217 = !DILocation(line: 128, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !204, file: !17, line: 128, column: 9)
!219 = !DILocation(line: 128, column: 14, scope: !218)
!220 = !DILocation(line: 128, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !17, line: 128, column: 9)
!222 = !DILocation(line: 128, column: 25, scope: !221)
!223 = !DILocation(line: 128, column: 23, scope: !221)
!224 = !DILocation(line: 128, column: 9, scope: !218)
!225 = !DILocation(line: 130, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !17, line: 129, column: 9)
!227 = !DILocation(line: 130, column: 28, scope: !226)
!228 = !DILocation(line: 130, column: 18, scope: !226)
!229 = !DILocation(line: 130, column: 13, scope: !226)
!230 = !DILocation(line: 130, column: 21, scope: !226)
!231 = !DILocation(line: 131, column: 9, scope: !226)
!232 = !DILocation(line: 128, column: 35, scope: !221)
!233 = !DILocation(line: 128, column: 9, scope: !221)
!234 = distinct !{!234, !224, !235, !79}
!235 = !DILocation(line: 131, column: 9, scope: !218)
!236 = !DILocation(line: 132, column: 9, scope: !204)
!237 = !DILocation(line: 132, column: 21, scope: !204)
!238 = !DILocation(line: 133, column: 20, scope: !204)
!239 = !DILocation(line: 133, column: 9, scope: !204)
!240 = !DILocation(line: 134, column: 14, scope: !204)
!241 = !DILocation(line: 134, column: 9, scope: !204)
!242 = !DILocation(line: 136, column: 1, scope: !181)
