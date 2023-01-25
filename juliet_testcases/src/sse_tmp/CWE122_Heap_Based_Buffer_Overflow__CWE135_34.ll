; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i8* null, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !35
  %0 = bitcast i8* %call to i32*, !dbg !36
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !34
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  %cmp = icmp eq i32* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !44
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  %5 = bitcast i32* %4 to i8*, !dbg !48
  store i8* %5, i8** %data, align 8, !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !51
  store i8* %6, i8** %unionFirst, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !53, metadata !DIExpression()), !dbg !55
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !56
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !56
  store i8* %7, i8** %data2, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !57, metadata !DIExpression()), !dbg !61
  %8 = load i8*, i8** %data2, align 8, !dbg !62
  %call3 = call i64 @strlen(i8* %8) #9, !dbg !63
  store i64 %call3, i64* %dataLen, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !64, metadata !DIExpression()), !dbg !65
  %9 = load i64, i64* %dataLen, align 8, !dbg !66
  %add = add i64 %9, 1, !dbg !67
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !68
  store i8* %call4, i8** %dest, align 8, !dbg !65
  %10 = load i8*, i8** %dest, align 8, !dbg !69
  %cmp5 = icmp eq i8* %10, null, !dbg !71
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !72

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !73
  unreachable, !dbg !73

if.end7:                                          ; preds = %if.end
  %11 = load i8*, i8** %dest, align 8, !dbg !75
  %12 = bitcast i8* %11 to i32*, !dbg !75
  %13 = load i8*, i8** %data2, align 8, !dbg !76
  %14 = bitcast i8* %13 to i32*, !dbg !76
  %call8 = call i32* @wcscpy(i32* %12, i32* %14) #7, !dbg !77
  %15 = load i8*, i8** %dest, align 8, !dbg !78
  call void @printLine(i8* %15), !dbg !79
  %16 = load i8*, i8** %dest, align 8, !dbg !80
  call void @free(i8* %16) #7, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_34_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  call void @goodB2G(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_34_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_34_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !114
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !113
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !122
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  store i8* %3, i8** %data, align 8, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !128
  store i8* %4, i8** %unionFirst, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !130, metadata !DIExpression()), !dbg !132
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !133
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !133
  store i8* %5, i8** %data1, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !136
  %6 = load i8*, i8** %data1, align 8, !dbg !137
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !138
  store i64 %call2, i64* %dataLen, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %7 = load i64, i64* %dataLen, align 8, !dbg !141
  %add = add i64 %7, 1, !dbg !142
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !143
  store i8* %call3, i8** %dest, align 8, !dbg !140
  %8 = load i8*, i8** %dest, align 8, !dbg !144
  %cmp4 = icmp eq i8* %8, null, !dbg !146
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !147

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !148
  unreachable, !dbg !148

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %dest, align 8, !dbg !150
  %10 = load i8*, i8** %data1, align 8, !dbg !151
  %call7 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !152
  %11 = load i8*, i8** %dest, align 8, !dbg !153
  call void @printLine(i8* %11), !dbg !154
  %12 = load i8*, i8** %dest, align 8, !dbg !155
  call void @free(i8* %12) #7, !dbg !156
  ret void, !dbg !157
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !158 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion, metadata !161, metadata !DIExpression()), !dbg !162
  store i8* null, i8** %data, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !166
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !167
  %0 = bitcast i8* %call to i32*, !dbg !168
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !166
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !169
  %cmp = icmp eq i32* %1, null, !dbg !171
  br i1 %cmp, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !175
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !176
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !179
  %5 = bitcast i32* %4 to i8*, !dbg !180
  store i8* %5, i8** %data, align 8, !dbg !181
  %6 = load i8*, i8** %data, align 8, !dbg !182
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !183
  store i8* %6, i8** %unionFirst, align 8, !dbg !184
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !185, metadata !DIExpression()), !dbg !187
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !188
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !188
  store i8* %7, i8** %data2, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !189, metadata !DIExpression()), !dbg !191
  %8 = load i8*, i8** %data2, align 8, !dbg !192
  %9 = bitcast i8* %8 to i32*, !dbg !193
  %call3 = call i64 @wcslen(i32* %9) #9, !dbg !194
  store i64 %call3, i64* %dataLen, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !195, metadata !DIExpression()), !dbg !196
  %10 = load i64, i64* %dataLen, align 8, !dbg !197
  %add = add i64 %10, 1, !dbg !198
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !199
  store i8* %call4, i8** %dest, align 8, !dbg !196
  %11 = load i8*, i8** %dest, align 8, !dbg !200
  %cmp5 = icmp eq i8* %11, null, !dbg !202
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !203

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !204
  unreachable, !dbg !204

if.end7:                                          ; preds = %if.end
  %12 = load i8*, i8** %dest, align 8, !dbg !206
  %13 = bitcast i8* %12 to i32*, !dbg !206
  %14 = load i8*, i8** %data2, align 8, !dbg !207
  %15 = bitcast i8* %14 to i32*, !dbg !207
  %call8 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !208
  %16 = load i8*, i8** %dest, align 8, !dbg !209
  %17 = bitcast i8* %16 to i32*, !dbg !210
  call void @printWLine(i32* %17), !dbg !211
  %18 = load i8*, i8** %dest, align 8, !dbg !212
  call void @free(i8* %18) #7, !dbg !213
  ret void, !dbg !214
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_34_bad", scope: !19, file: !19, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_34.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !19, line: 33, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_34_unionType", file: !19, line: 26, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !19, line: 22, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !19, line: 24, baseType: !4, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !19, line: 25, baseType: !4, size: 64)
!30 = !DILocation(line: 33, column: 60, scope: !18)
!31 = !DILocation(line: 34, column: 10, scope: !18)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !33, file: !19, line: 36, type: !5)
!33 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!34 = !DILocation(line: 36, column: 19, scope: !33)
!35 = !DILocation(line: 36, column: 46, scope: !33)
!36 = !DILocation(line: 36, column: 35, scope: !33)
!37 = !DILocation(line: 37, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !19, line: 37, column: 13)
!39 = !DILocation(line: 37, column: 27, scope: !38)
!40 = !DILocation(line: 37, column: 13, scope: !33)
!41 = !DILocation(line: 37, column: 37, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !19, line: 37, column: 36)
!43 = !DILocation(line: 38, column: 17, scope: !33)
!44 = !DILocation(line: 38, column: 9, scope: !33)
!45 = !DILocation(line: 39, column: 9, scope: !33)
!46 = !DILocation(line: 39, column: 29, scope: !33)
!47 = !DILocation(line: 41, column: 24, scope: !33)
!48 = !DILocation(line: 41, column: 16, scope: !33)
!49 = !DILocation(line: 41, column: 14, scope: !33)
!50 = !DILocation(line: 43, column: 26, scope: !18)
!51 = !DILocation(line: 43, column: 13, scope: !18)
!52 = !DILocation(line: 43, column: 24, scope: !18)
!53 = !DILocalVariable(name: "data", scope: !54, file: !19, line: 45, type: !4)
!54 = distinct !DILexicalBlock(scope: !18, file: !19, line: 44, column: 5)
!55 = !DILocation(line: 45, column: 16, scope: !54)
!56 = !DILocation(line: 45, column: 31, scope: !54)
!57 = !DILocalVariable(name: "dataLen", scope: !58, file: !19, line: 48, type: !59)
!58 = distinct !DILexicalBlock(scope: !54, file: !19, line: 46, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !60)
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 48, column: 20, scope: !58)
!62 = !DILocation(line: 48, column: 45, scope: !58)
!63 = !DILocation(line: 48, column: 30, scope: !58)
!64 = !DILocalVariable(name: "dest", scope: !58, file: !19, line: 49, type: !4)
!65 = !DILocation(line: 49, column: 20, scope: !58)
!66 = !DILocation(line: 49, column: 42, scope: !58)
!67 = !DILocation(line: 49, column: 49, scope: !58)
!68 = !DILocation(line: 49, column: 35, scope: !58)
!69 = !DILocation(line: 50, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !58, file: !19, line: 50, column: 17)
!71 = !DILocation(line: 50, column: 22, scope: !70)
!72 = !DILocation(line: 50, column: 17, scope: !58)
!73 = !DILocation(line: 50, column: 32, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !19, line: 50, column: 31)
!75 = !DILocation(line: 51, column: 26, scope: !58)
!76 = !DILocation(line: 51, column: 32, scope: !58)
!77 = !DILocation(line: 51, column: 19, scope: !58)
!78 = !DILocation(line: 52, column: 31, scope: !58)
!79 = !DILocation(line: 52, column: 13, scope: !58)
!80 = !DILocation(line: 53, column: 18, scope: !58)
!81 = !DILocation(line: 53, column: 13, scope: !58)
!82 = !DILocation(line: 56, column: 1, scope: !18)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_34_good", scope: !19, file: !19, line: 120, type: !20, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 122, column: 5, scope: !83)
!85 = !DILocation(line: 123, column: 5, scope: !83)
!86 = !DILocation(line: 124, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 134, type: !88, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!8, !8, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !19, line: 134, type: !8)
!92 = !DILocation(line: 134, column: 14, scope: !87)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !19, line: 134, type: !90)
!94 = !DILocation(line: 134, column: 27, scope: !87)
!95 = !DILocation(line: 137, column: 22, scope: !87)
!96 = !DILocation(line: 137, column: 12, scope: !87)
!97 = !DILocation(line: 137, column: 5, scope: !87)
!98 = !DILocation(line: 139, column: 5, scope: !87)
!99 = !DILocation(line: 140, column: 5, scope: !87)
!100 = !DILocation(line: 141, column: 5, scope: !87)
!101 = !DILocation(line: 144, column: 5, scope: !87)
!102 = !DILocation(line: 145, column: 5, scope: !87)
!103 = !DILocation(line: 146, column: 5, scope: !87)
!104 = !DILocation(line: 148, column: 5, scope: !87)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !19, line: 65, type: !4)
!107 = !DILocation(line: 65, column: 12, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !19, line: 66, type: !25)
!109 = !DILocation(line: 66, column: 60, scope: !105)
!110 = !DILocation(line: 67, column: 10, scope: !105)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !19, line: 69, type: !9)
!112 = distinct !DILexicalBlock(scope: !105, file: !19, line: 68, column: 5)
!113 = !DILocation(line: 69, column: 16, scope: !112)
!114 = !DILocation(line: 69, column: 41, scope: !112)
!115 = !DILocation(line: 70, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !19, line: 70, column: 13)
!117 = !DILocation(line: 70, column: 28, scope: !116)
!118 = !DILocation(line: 70, column: 13, scope: !112)
!119 = !DILocation(line: 70, column: 38, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !19, line: 70, column: 37)
!121 = !DILocation(line: 71, column: 16, scope: !112)
!122 = !DILocation(line: 71, column: 9, scope: !112)
!123 = !DILocation(line: 72, column: 9, scope: !112)
!124 = !DILocation(line: 72, column: 30, scope: !112)
!125 = !DILocation(line: 74, column: 24, scope: !112)
!126 = !DILocation(line: 74, column: 14, scope: !112)
!127 = !DILocation(line: 76, column: 26, scope: !105)
!128 = !DILocation(line: 76, column: 13, scope: !105)
!129 = !DILocation(line: 76, column: 24, scope: !105)
!130 = !DILocalVariable(name: "data", scope: !131, file: !19, line: 78, type: !4)
!131 = distinct !DILexicalBlock(scope: !105, file: !19, line: 77, column: 5)
!132 = !DILocation(line: 78, column: 16, scope: !131)
!133 = !DILocation(line: 78, column: 31, scope: !131)
!134 = !DILocalVariable(name: "dataLen", scope: !135, file: !19, line: 81, type: !59)
!135 = distinct !DILexicalBlock(scope: !131, file: !19, line: 79, column: 9)
!136 = !DILocation(line: 81, column: 20, scope: !135)
!137 = !DILocation(line: 81, column: 45, scope: !135)
!138 = !DILocation(line: 81, column: 30, scope: !135)
!139 = !DILocalVariable(name: "dest", scope: !135, file: !19, line: 82, type: !4)
!140 = !DILocation(line: 82, column: 20, scope: !135)
!141 = !DILocation(line: 82, column: 42, scope: !135)
!142 = !DILocation(line: 82, column: 49, scope: !135)
!143 = !DILocation(line: 82, column: 35, scope: !135)
!144 = !DILocation(line: 83, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !19, line: 83, column: 17)
!146 = !DILocation(line: 83, column: 22, scope: !145)
!147 = !DILocation(line: 83, column: 17, scope: !135)
!148 = !DILocation(line: 83, column: 32, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !19, line: 83, column: 31)
!150 = !DILocation(line: 84, column: 26, scope: !135)
!151 = !DILocation(line: 84, column: 32, scope: !135)
!152 = !DILocation(line: 84, column: 19, scope: !135)
!153 = !DILocation(line: 85, column: 31, scope: !135)
!154 = !DILocation(line: 85, column: 13, scope: !135)
!155 = !DILocation(line: 86, column: 18, scope: !135)
!156 = !DILocation(line: 86, column: 13, scope: !135)
!157 = !DILocation(line: 89, column: 1, scope: !105)
!158 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocalVariable(name: "data", scope: !158, file: !19, line: 94, type: !4)
!160 = !DILocation(line: 94, column: 12, scope: !158)
!161 = !DILocalVariable(name: "myUnion", scope: !158, file: !19, line: 95, type: !25)
!162 = !DILocation(line: 95, column: 60, scope: !158)
!163 = !DILocation(line: 96, column: 10, scope: !158)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !165, file: !19, line: 98, type: !5)
!165 = distinct !DILexicalBlock(scope: !158, file: !19, line: 97, column: 5)
!166 = !DILocation(line: 98, column: 19, scope: !165)
!167 = !DILocation(line: 98, column: 46, scope: !165)
!168 = !DILocation(line: 98, column: 35, scope: !165)
!169 = !DILocation(line: 99, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !19, line: 99, column: 13)
!171 = !DILocation(line: 99, column: 27, scope: !170)
!172 = !DILocation(line: 99, column: 13, scope: !165)
!173 = !DILocation(line: 99, column: 37, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !19, line: 99, column: 36)
!175 = !DILocation(line: 100, column: 17, scope: !165)
!176 = !DILocation(line: 100, column: 9, scope: !165)
!177 = !DILocation(line: 101, column: 9, scope: !165)
!178 = !DILocation(line: 101, column: 29, scope: !165)
!179 = !DILocation(line: 103, column: 24, scope: !165)
!180 = !DILocation(line: 103, column: 16, scope: !165)
!181 = !DILocation(line: 103, column: 14, scope: !165)
!182 = !DILocation(line: 105, column: 26, scope: !158)
!183 = !DILocation(line: 105, column: 13, scope: !158)
!184 = !DILocation(line: 105, column: 24, scope: !158)
!185 = !DILocalVariable(name: "data", scope: !186, file: !19, line: 107, type: !4)
!186 = distinct !DILexicalBlock(scope: !158, file: !19, line: 106, column: 5)
!187 = !DILocation(line: 107, column: 16, scope: !186)
!188 = !DILocation(line: 107, column: 31, scope: !186)
!189 = !DILocalVariable(name: "dataLen", scope: !190, file: !19, line: 110, type: !59)
!190 = distinct !DILexicalBlock(scope: !186, file: !19, line: 108, column: 9)
!191 = !DILocation(line: 110, column: 20, scope: !190)
!192 = !DILocation(line: 110, column: 48, scope: !190)
!193 = !DILocation(line: 110, column: 37, scope: !190)
!194 = !DILocation(line: 110, column: 30, scope: !190)
!195 = !DILocalVariable(name: "dest", scope: !190, file: !19, line: 111, type: !4)
!196 = !DILocation(line: 111, column: 20, scope: !190)
!197 = !DILocation(line: 111, column: 42, scope: !190)
!198 = !DILocation(line: 111, column: 49, scope: !190)
!199 = !DILocation(line: 111, column: 35, scope: !190)
!200 = !DILocation(line: 112, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !190, file: !19, line: 112, column: 17)
!202 = !DILocation(line: 112, column: 22, scope: !201)
!203 = !DILocation(line: 112, column: 17, scope: !190)
!204 = !DILocation(line: 112, column: 32, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !19, line: 112, column: 31)
!206 = !DILocation(line: 113, column: 26, scope: !190)
!207 = !DILocation(line: 113, column: 32, scope: !190)
!208 = !DILocation(line: 113, column: 19, scope: !190)
!209 = !DILocation(line: 114, column: 35, scope: !190)
!210 = !DILocation(line: 114, column: 24, scope: !190)
!211 = !DILocation(line: 114, column: 13, scope: !190)
!212 = !DILocation(line: 115, column: 18, scope: !190)
!213 = !DILocation(line: 115, column: 13, scope: !190)
!214 = !DILocation(line: 118, column: 1, scope: !158)
