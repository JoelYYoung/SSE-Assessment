; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %data3 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %1 = load i8*, i8** %0, align 8, !dbg !34
  store i8* %1, i8** %data1, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !35, metadata !DIExpression()), !dbg !37
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !38
  %2 = bitcast i8* %call to i32*, !dbg !39
  store i32* %2, i32** %dataBadBuffer, align 8, !dbg !37
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %cmp = icmp eq i32* %3, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !46
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !47
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !50
  %7 = bitcast i32* %6 to i8*, !dbg !51
  store i8* %7, i8** %data1, align 8, !dbg !52
  %8 = load i8*, i8** %data1, align 8, !dbg !53
  %9 = load i8**, i8*** %dataPtr1, align 8, !dbg !54
  store i8* %8, i8** %9, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !56, metadata !DIExpression()), !dbg !58
  %10 = load i8**, i8*** %dataPtr2, align 8, !dbg !59
  %11 = load i8*, i8** %10, align 8, !dbg !60
  store i8* %11, i8** %data3, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !61, metadata !DIExpression()), !dbg !65
  %12 = load i8*, i8** %data3, align 8, !dbg !66
  %call4 = call i64 @strlen(i8* %12) #9, !dbg !67
  store i64 %call4, i64* %dataLen, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !68, metadata !DIExpression()), !dbg !69
  %13 = load i64, i64* %dataLen, align 8, !dbg !70
  %add = add i64 %13, 1, !dbg !71
  %call5 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !72
  store i8* %call5, i8** %dest, align 8, !dbg !69
  %14 = load i8*, i8** %dest, align 8, !dbg !73
  %cmp6 = icmp eq i8* %14, null, !dbg !75
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !76

if.then7:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !77
  unreachable, !dbg !77

if.end8:                                          ; preds = %if.end
  %15 = load i8*, i8** %dest, align 8, !dbg !79
  %16 = bitcast i8* %15 to i32*, !dbg !79
  %17 = load i8*, i8** %data3, align 8, !dbg !80
  %18 = bitcast i8* %17 to i32*, !dbg !80
  %call9 = call i32* @wcscpy(i32* %16, i32* %18) #7, !dbg !81
  %19 = load i8*, i8** %dest, align 8, !dbg !82
  call void @printLine(i8* %19), !dbg !83
  %20 = load i8*, i8** %dest, align 8, !dbg !84
  call void @free(i8* %20) #7, !dbg !85
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
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_32_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  call void @goodB2G(), !dbg !89
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #7, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #7, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_32_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_32_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !115
  store i8* null, i8** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !117, metadata !DIExpression()), !dbg !119
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !120
  %1 = load i8*, i8** %0, align 8, !dbg !121
  store i8* %1, i8** %data1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !125
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !124
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  %cmp = icmp eq i8* %2, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !133
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !136
  store i8* %5, i8** %data1, align 8, !dbg !137
  %6 = load i8*, i8** %data1, align 8, !dbg !138
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !139
  store i8* %6, i8** %7, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !141, metadata !DIExpression()), !dbg !143
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !144
  %9 = load i8*, i8** %8, align 8, !dbg !145
  store i8* %9, i8** %data2, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !146, metadata !DIExpression()), !dbg !148
  %10 = load i8*, i8** %data2, align 8, !dbg !149
  %call3 = call i64 @strlen(i8* %10) #9, !dbg !150
  store i64 %call3, i64* %dataLen, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !151, metadata !DIExpression()), !dbg !152
  %11 = load i64, i64* %dataLen, align 8, !dbg !153
  %add = add i64 %11, 1, !dbg !154
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !155
  store i8* %call4, i8** %dest, align 8, !dbg !152
  %12 = load i8*, i8** %dest, align 8, !dbg !156
  %cmp5 = icmp eq i8* %12, null, !dbg !158
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !159

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !160
  unreachable, !dbg !160

if.end7:                                          ; preds = %if.end
  %13 = load i8*, i8** %dest, align 8, !dbg !162
  %14 = load i8*, i8** %data2, align 8, !dbg !163
  %call8 = call i8* @strcpy(i8* %13, i8* %14) #7, !dbg !164
  %15 = load i8*, i8** %dest, align 8, !dbg !165
  call void @printLine(i8* %15), !dbg !166
  %16 = load i8*, i8** %dest, align 8, !dbg !167
  call void @free(i8* %16) #7, !dbg !168
  ret void, !dbg !169
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !170 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %data3 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !173, metadata !DIExpression()), !dbg !174
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !174
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !175, metadata !DIExpression()), !dbg !176
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !176
  store i8* null, i8** %data, align 8, !dbg !177
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !178, metadata !DIExpression()), !dbg !180
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !181
  %1 = load i8*, i8** %0, align 8, !dbg !182
  store i8* %1, i8** %data1, align 8, !dbg !180
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !183, metadata !DIExpression()), !dbg !185
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !186
  %2 = bitcast i8* %call to i32*, !dbg !187
  store i32* %2, i32** %dataBadBuffer, align 8, !dbg !185
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !188
  %cmp = icmp eq i32* %3, null, !dbg !190
  br i1 %cmp, label %if.then, label %if.end, !dbg !191

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !192
  unreachable, !dbg !192

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !194
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !195
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !196
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !196
  store i32 0, i32* %arrayidx, align 4, !dbg !197
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !198
  %7 = bitcast i32* %6 to i8*, !dbg !199
  store i8* %7, i8** %data1, align 8, !dbg !200
  %8 = load i8*, i8** %data1, align 8, !dbg !201
  %9 = load i8**, i8*** %dataPtr1, align 8, !dbg !202
  store i8* %8, i8** %9, align 8, !dbg !203
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !204, metadata !DIExpression()), !dbg !206
  %10 = load i8**, i8*** %dataPtr2, align 8, !dbg !207
  %11 = load i8*, i8** %10, align 8, !dbg !208
  store i8* %11, i8** %data3, align 8, !dbg !206
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !209, metadata !DIExpression()), !dbg !211
  %12 = load i8*, i8** %data3, align 8, !dbg !212
  %13 = bitcast i8* %12 to i32*, !dbg !213
  %call4 = call i64 @wcslen(i32* %13) #9, !dbg !214
  store i64 %call4, i64* %dataLen, align 8, !dbg !211
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !215, metadata !DIExpression()), !dbg !216
  %14 = load i64, i64* %dataLen, align 8, !dbg !217
  %add = add i64 %14, 1, !dbg !218
  %call5 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !219
  store i8* %call5, i8** %dest, align 8, !dbg !216
  %15 = load i8*, i8** %dest, align 8, !dbg !220
  %cmp6 = icmp eq i8* %15, null, !dbg !222
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !223

if.then7:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !224
  unreachable, !dbg !224

if.end8:                                          ; preds = %if.end
  %16 = load i8*, i8** %dest, align 8, !dbg !226
  %17 = bitcast i8* %16 to i32*, !dbg !226
  %18 = load i8*, i8** %data3, align 8, !dbg !227
  %19 = bitcast i8* %18 to i32*, !dbg !227
  %call9 = call i32* @wcscpy(i32* %17, i32* %19) #7, !dbg !228
  %20 = load i8*, i8** %dest, align 8, !dbg !229
  %21 = bitcast i8* %20 to i32*, !dbg !230
  call void @printWLine(i32* %21), !dbg !231
  %22 = load i8*, i8** %dest, align 8, !dbg !232
  call void @free(i8* %22) #7, !dbg !233
  ret void, !dbg !234
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_32_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_32.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 27, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!26 = !DILocation(line: 27, column: 13, scope: !18)
!27 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 28, type: !25)
!28 = !DILocation(line: 28, column: 13, scope: !18)
!29 = !DILocation(line: 29, column: 10, scope: !18)
!30 = !DILocalVariable(name: "data", scope: !31, file: !19, line: 31, type: !4)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 5)
!32 = !DILocation(line: 31, column: 16, scope: !31)
!33 = !DILocation(line: 31, column: 24, scope: !31)
!34 = !DILocation(line: 31, column: 23, scope: !31)
!35 = !DILocalVariable(name: "dataBadBuffer", scope: !36, file: !19, line: 33, type: !5)
!36 = distinct !DILexicalBlock(scope: !31, file: !19, line: 32, column: 9)
!37 = !DILocation(line: 33, column: 23, scope: !36)
!38 = !DILocation(line: 33, column: 50, scope: !36)
!39 = !DILocation(line: 33, column: 39, scope: !36)
!40 = !DILocation(line: 34, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !36, file: !19, line: 34, column: 17)
!42 = !DILocation(line: 34, column: 31, scope: !41)
!43 = !DILocation(line: 34, column: 17, scope: !36)
!44 = !DILocation(line: 34, column: 41, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !19, line: 34, column: 40)
!46 = !DILocation(line: 35, column: 21, scope: !36)
!47 = !DILocation(line: 35, column: 13, scope: !36)
!48 = !DILocation(line: 36, column: 13, scope: !36)
!49 = !DILocation(line: 36, column: 33, scope: !36)
!50 = !DILocation(line: 38, column: 28, scope: !36)
!51 = !DILocation(line: 38, column: 20, scope: !36)
!52 = !DILocation(line: 38, column: 18, scope: !36)
!53 = !DILocation(line: 40, column: 21, scope: !31)
!54 = !DILocation(line: 40, column: 10, scope: !31)
!55 = !DILocation(line: 40, column: 19, scope: !31)
!56 = !DILocalVariable(name: "data", scope: !57, file: !19, line: 43, type: !4)
!57 = distinct !DILexicalBlock(scope: !18, file: !19, line: 42, column: 5)
!58 = !DILocation(line: 43, column: 16, scope: !57)
!59 = !DILocation(line: 43, column: 24, scope: !57)
!60 = !DILocation(line: 43, column: 23, scope: !57)
!61 = !DILocalVariable(name: "dataLen", scope: !62, file: !19, line: 46, type: !63)
!62 = distinct !DILexicalBlock(scope: !57, file: !19, line: 44, column: 9)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !64)
!64 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 46, column: 20, scope: !62)
!66 = !DILocation(line: 46, column: 45, scope: !62)
!67 = !DILocation(line: 46, column: 30, scope: !62)
!68 = !DILocalVariable(name: "dest", scope: !62, file: !19, line: 47, type: !4)
!69 = !DILocation(line: 47, column: 20, scope: !62)
!70 = !DILocation(line: 47, column: 42, scope: !62)
!71 = !DILocation(line: 47, column: 49, scope: !62)
!72 = !DILocation(line: 47, column: 35, scope: !62)
!73 = !DILocation(line: 48, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !62, file: !19, line: 48, column: 17)
!75 = !DILocation(line: 48, column: 22, scope: !74)
!76 = !DILocation(line: 48, column: 17, scope: !62)
!77 = !DILocation(line: 48, column: 32, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !19, line: 48, column: 31)
!79 = !DILocation(line: 49, column: 26, scope: !62)
!80 = !DILocation(line: 49, column: 32, scope: !62)
!81 = !DILocation(line: 49, column: 19, scope: !62)
!82 = !DILocation(line: 50, column: 31, scope: !62)
!83 = !DILocation(line: 50, column: 13, scope: !62)
!84 = !DILocation(line: 51, column: 18, scope: !62)
!85 = !DILocation(line: 51, column: 13, scope: !62)
!86 = !DILocation(line: 54, column: 1, scope: !18)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_32_good", scope: !19, file: !19, line: 126, type: !20, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 128, column: 5, scope: !87)
!89 = !DILocation(line: 129, column: 5, scope: !87)
!90 = !DILocation(line: 130, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 140, type: !92, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!8, !8, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !19, line: 140, type: !8)
!96 = !DILocation(line: 140, column: 14, scope: !91)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !19, line: 140, type: !94)
!98 = !DILocation(line: 140, column: 27, scope: !91)
!99 = !DILocation(line: 143, column: 22, scope: !91)
!100 = !DILocation(line: 143, column: 12, scope: !91)
!101 = !DILocation(line: 143, column: 5, scope: !91)
!102 = !DILocation(line: 145, column: 5, scope: !91)
!103 = !DILocation(line: 146, column: 5, scope: !91)
!104 = !DILocation(line: 147, column: 5, scope: !91)
!105 = !DILocation(line: 150, column: 5, scope: !91)
!106 = !DILocation(line: 151, column: 5, scope: !91)
!107 = !DILocation(line: 152, column: 5, scope: !91)
!108 = !DILocation(line: 154, column: 5, scope: !91)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !19, line: 63, type: !4)
!111 = !DILocation(line: 63, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataPtr1", scope: !109, file: !19, line: 64, type: !25)
!113 = !DILocation(line: 64, column: 13, scope: !109)
!114 = !DILocalVariable(name: "dataPtr2", scope: !109, file: !19, line: 65, type: !25)
!115 = !DILocation(line: 65, column: 13, scope: !109)
!116 = !DILocation(line: 66, column: 10, scope: !109)
!117 = !DILocalVariable(name: "data", scope: !118, file: !19, line: 68, type: !4)
!118 = distinct !DILexicalBlock(scope: !109, file: !19, line: 67, column: 5)
!119 = !DILocation(line: 68, column: 16, scope: !118)
!120 = !DILocation(line: 68, column: 24, scope: !118)
!121 = !DILocation(line: 68, column: 23, scope: !118)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !19, line: 70, type: !9)
!123 = distinct !DILexicalBlock(scope: !118, file: !19, line: 69, column: 9)
!124 = !DILocation(line: 70, column: 20, scope: !123)
!125 = !DILocation(line: 70, column: 45, scope: !123)
!126 = !DILocation(line: 71, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !19, line: 71, column: 17)
!128 = !DILocation(line: 71, column: 32, scope: !127)
!129 = !DILocation(line: 71, column: 17, scope: !123)
!130 = !DILocation(line: 71, column: 42, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !19, line: 71, column: 41)
!132 = !DILocation(line: 72, column: 20, scope: !123)
!133 = !DILocation(line: 72, column: 13, scope: !123)
!134 = !DILocation(line: 73, column: 13, scope: !123)
!135 = !DILocation(line: 73, column: 34, scope: !123)
!136 = !DILocation(line: 75, column: 28, scope: !123)
!137 = !DILocation(line: 75, column: 18, scope: !123)
!138 = !DILocation(line: 77, column: 21, scope: !118)
!139 = !DILocation(line: 77, column: 10, scope: !118)
!140 = !DILocation(line: 77, column: 19, scope: !118)
!141 = !DILocalVariable(name: "data", scope: !142, file: !19, line: 80, type: !4)
!142 = distinct !DILexicalBlock(scope: !109, file: !19, line: 79, column: 5)
!143 = !DILocation(line: 80, column: 16, scope: !142)
!144 = !DILocation(line: 80, column: 24, scope: !142)
!145 = !DILocation(line: 80, column: 23, scope: !142)
!146 = !DILocalVariable(name: "dataLen", scope: !147, file: !19, line: 83, type: !63)
!147 = distinct !DILexicalBlock(scope: !142, file: !19, line: 81, column: 9)
!148 = !DILocation(line: 83, column: 20, scope: !147)
!149 = !DILocation(line: 83, column: 45, scope: !147)
!150 = !DILocation(line: 83, column: 30, scope: !147)
!151 = !DILocalVariable(name: "dest", scope: !147, file: !19, line: 84, type: !4)
!152 = !DILocation(line: 84, column: 20, scope: !147)
!153 = !DILocation(line: 84, column: 42, scope: !147)
!154 = !DILocation(line: 84, column: 49, scope: !147)
!155 = !DILocation(line: 84, column: 35, scope: !147)
!156 = !DILocation(line: 85, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !147, file: !19, line: 85, column: 17)
!158 = !DILocation(line: 85, column: 22, scope: !157)
!159 = !DILocation(line: 85, column: 17, scope: !147)
!160 = !DILocation(line: 85, column: 32, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !19, line: 85, column: 31)
!162 = !DILocation(line: 86, column: 26, scope: !147)
!163 = !DILocation(line: 86, column: 32, scope: !147)
!164 = !DILocation(line: 86, column: 19, scope: !147)
!165 = !DILocation(line: 87, column: 31, scope: !147)
!166 = !DILocation(line: 87, column: 13, scope: !147)
!167 = !DILocation(line: 88, column: 18, scope: !147)
!168 = !DILocation(line: 88, column: 13, scope: !147)
!169 = !DILocation(line: 91, column: 1, scope: !109)
!170 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 94, type: !20, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DILocalVariable(name: "data", scope: !170, file: !19, line: 96, type: !4)
!172 = !DILocation(line: 96, column: 12, scope: !170)
!173 = !DILocalVariable(name: "dataPtr1", scope: !170, file: !19, line: 97, type: !25)
!174 = !DILocation(line: 97, column: 13, scope: !170)
!175 = !DILocalVariable(name: "dataPtr2", scope: !170, file: !19, line: 98, type: !25)
!176 = !DILocation(line: 98, column: 13, scope: !170)
!177 = !DILocation(line: 99, column: 10, scope: !170)
!178 = !DILocalVariable(name: "data", scope: !179, file: !19, line: 101, type: !4)
!179 = distinct !DILexicalBlock(scope: !170, file: !19, line: 100, column: 5)
!180 = !DILocation(line: 101, column: 16, scope: !179)
!181 = !DILocation(line: 101, column: 24, scope: !179)
!182 = !DILocation(line: 101, column: 23, scope: !179)
!183 = !DILocalVariable(name: "dataBadBuffer", scope: !184, file: !19, line: 103, type: !5)
!184 = distinct !DILexicalBlock(scope: !179, file: !19, line: 102, column: 9)
!185 = !DILocation(line: 103, column: 23, scope: !184)
!186 = !DILocation(line: 103, column: 50, scope: !184)
!187 = !DILocation(line: 103, column: 39, scope: !184)
!188 = !DILocation(line: 104, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !19, line: 104, column: 17)
!190 = !DILocation(line: 104, column: 31, scope: !189)
!191 = !DILocation(line: 104, column: 17, scope: !184)
!192 = !DILocation(line: 104, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !19, line: 104, column: 40)
!194 = !DILocation(line: 105, column: 21, scope: !184)
!195 = !DILocation(line: 105, column: 13, scope: !184)
!196 = !DILocation(line: 106, column: 13, scope: !184)
!197 = !DILocation(line: 106, column: 33, scope: !184)
!198 = !DILocation(line: 108, column: 28, scope: !184)
!199 = !DILocation(line: 108, column: 20, scope: !184)
!200 = !DILocation(line: 108, column: 18, scope: !184)
!201 = !DILocation(line: 110, column: 21, scope: !179)
!202 = !DILocation(line: 110, column: 10, scope: !179)
!203 = !DILocation(line: 110, column: 19, scope: !179)
!204 = !DILocalVariable(name: "data", scope: !205, file: !19, line: 113, type: !4)
!205 = distinct !DILexicalBlock(scope: !170, file: !19, line: 112, column: 5)
!206 = !DILocation(line: 113, column: 16, scope: !205)
!207 = !DILocation(line: 113, column: 24, scope: !205)
!208 = !DILocation(line: 113, column: 23, scope: !205)
!209 = !DILocalVariable(name: "dataLen", scope: !210, file: !19, line: 116, type: !63)
!210 = distinct !DILexicalBlock(scope: !205, file: !19, line: 114, column: 9)
!211 = !DILocation(line: 116, column: 20, scope: !210)
!212 = !DILocation(line: 116, column: 48, scope: !210)
!213 = !DILocation(line: 116, column: 37, scope: !210)
!214 = !DILocation(line: 116, column: 30, scope: !210)
!215 = !DILocalVariable(name: "dest", scope: !210, file: !19, line: 117, type: !4)
!216 = !DILocation(line: 117, column: 20, scope: !210)
!217 = !DILocation(line: 117, column: 42, scope: !210)
!218 = !DILocation(line: 117, column: 49, scope: !210)
!219 = !DILocation(line: 117, column: 35, scope: !210)
!220 = !DILocation(line: 118, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !210, file: !19, line: 118, column: 17)
!222 = !DILocation(line: 118, column: 22, scope: !221)
!223 = !DILocation(line: 118, column: 17, scope: !210)
!224 = !DILocation(line: 118, column: 32, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !19, line: 118, column: 31)
!226 = !DILocation(line: 119, column: 26, scope: !210)
!227 = !DILocation(line: 119, column: 32, scope: !210)
!228 = !DILocation(line: 119, column: 19, scope: !210)
!229 = !DILocation(line: 120, column: 35, scope: !210)
!230 = !DILocation(line: 120, column: 24, scope: !210)
!231 = !DILocation(line: 120, column: 13, scope: !210)
!232 = !DILocation(line: 121, column: 18, scope: !210)
!233 = !DILocation(line: 121, column: 13, scope: !210)
!234 = !DILocation(line: 124, column: 1, scope: !170)
