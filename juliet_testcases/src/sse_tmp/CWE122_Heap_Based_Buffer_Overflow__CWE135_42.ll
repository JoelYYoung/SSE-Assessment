; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_42_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %call = call i8* @badSource(i8* %0), !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %call1 = call i64 @strlen(i8* %1) #7, !dbg !34
  store i64 %call1, i64* %dataLen, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = load i64, i64* %dataLen, align 8, !dbg !37
  %add = add i64 %2, 1, !dbg !38
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #8, !dbg !39
  store i8* %call2, i8** %dest, align 8, !dbg !36
  %3 = load i8*, i8** %dest, align 8, !dbg !40
  %cmp = icmp eq i8* %3, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !46
  %5 = bitcast i8* %4 to i32*, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %7 = bitcast i8* %6 to i32*, !dbg !47
  %call3 = call i32* @wcscpy(i32* %5, i32* %7) #8, !dbg !48
  %8 = load i8*, i8** %dest, align 8, !dbg !49
  call void @printLine(i8* %8), !dbg !50
  %9 = load i8*, i8** %dest, align 8, !dbg !51
  call void @free(i8* %9) #8, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !59, metadata !DIExpression()), !dbg !61
  %call = call noalias align 16 i8* @malloc(i64 200) #8, !dbg !62
  %0 = bitcast i8* %call to i32*, !dbg !63
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !61
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !64
  %cmp = icmp eq i32* %1, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !70
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !71
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !74
  %5 = bitcast i32* %4 to i8*, !dbg !75
  store i8* %5, i8** %data.addr, align 8, !dbg !76
  %6 = load i8*, i8** %data.addr, align 8, !dbg !77
  ret i8* %6, !dbg !78
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_42_good() #0 !dbg !79 {
entry:
  call void @goodB2G(), !dbg !80
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #8, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #8, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_42_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_42_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i8* null, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %call = call i8* @goodB2GSource(i8* %0), !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !108, metadata !DIExpression()), !dbg !110
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %2 = bitcast i8* %1 to i32*, !dbg !112
  %call1 = call i64 @wcslen(i32* %2) #7, !dbg !113
  store i64 %call1, i64* %dataLen, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !114, metadata !DIExpression()), !dbg !115
  %3 = load i64, i64* %dataLen, align 8, !dbg !116
  %add = add i64 %3, 1, !dbg !117
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #8, !dbg !118
  store i8* %call2, i8** %dest, align 8, !dbg !115
  %4 = load i8*, i8** %dest, align 8, !dbg !119
  %cmp = icmp eq i8* %4, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !125
  %6 = bitcast i8* %5 to i32*, !dbg !125
  %7 = load i8*, i8** %data, align 8, !dbg !126
  %8 = bitcast i8* %7 to i32*, !dbg !126
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #8, !dbg !127
  %9 = load i8*, i8** %dest, align 8, !dbg !128
  %10 = bitcast i8* %9 to i32*, !dbg !129
  call void @printWLine(i32* %10), !dbg !130
  %11 = load i8*, i8** %dest, align 8, !dbg !131
  call void @free(i8* %11) #8, !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodB2GSource(i8* %data) #0 !dbg !134 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 200) #8, !dbg !140
  %0 = bitcast i8* %call to i32*, !dbg !141
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !139
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !142
  %cmp = icmp eq i32* %1, null, !dbg !144
  br i1 %cmp, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !148
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !149
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !152
  %5 = bitcast i32* %4 to i8*, !dbg !153
  store i8* %5, i8** %data.addr, align 8, !dbg !154
  %6 = load i8*, i8** %data.addr, align 8, !dbg !155
  ret i8* %6, !dbg !156
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !157 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !158, metadata !DIExpression()), !dbg !159
  store i8* null, i8** %data, align 8, !dbg !160
  %0 = load i8*, i8** %data, align 8, !dbg !161
  %call = call i8* @goodG2BSource(i8* %0), !dbg !162
  store i8* %call, i8** %data, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !164, metadata !DIExpression()), !dbg !166
  %1 = load i8*, i8** %data, align 8, !dbg !167
  %call1 = call i64 @strlen(i8* %1) #7, !dbg !168
  store i64 %call1, i64* %dataLen, align 8, !dbg !166
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !169, metadata !DIExpression()), !dbg !170
  %2 = load i64, i64* %dataLen, align 8, !dbg !171
  %add = add i64 %2, 1, !dbg !172
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #8, !dbg !173
  store i8* %call2, i8** %dest, align 8, !dbg !170
  %3 = load i8*, i8** %dest, align 8, !dbg !174
  %cmp = icmp eq i8* %3, null, !dbg !176
  br i1 %cmp, label %if.then, label %if.end, !dbg !177

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !178
  unreachable, !dbg !178

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !180
  %5 = load i8*, i8** %data, align 8, !dbg !181
  %call3 = call i8* @strcpy(i8* %4, i8* %5) #8, !dbg !182
  %6 = load i8*, i8** %dest, align 8, !dbg !183
  call void @printLine(i8* %6), !dbg !184
  %7 = load i8*, i8** %dest, align 8, !dbg !185
  call void @free(i8* %7) #8, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !188 {
entry:
  %data.addr = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !191, metadata !DIExpression()), !dbg !193
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !194
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !193
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !195
  %cmp = icmp eq i8* %0, null, !dbg !197
  br i1 %cmp, label %if.then, label %if.end, !dbg !198

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !199
  unreachable, !dbg !199

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !202
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !203
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !203
  store i8 0, i8* %arrayidx, align 1, !dbg !204
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !205
  store i8* %3, i8** %data.addr, align 8, !dbg !206
  %4 = load i8*, i8** %data.addr, align 8, !dbg !207
  ret i8* %4, !dbg !208
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_42_bad", scope: !19, file: !19, line: 37, type: !20, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_42.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 39, type: !4)
!23 = !DILocation(line: 39, column: 12, scope: !18)
!24 = !DILocation(line: 40, column: 10, scope: !18)
!25 = !DILocation(line: 41, column: 22, scope: !18)
!26 = !DILocation(line: 41, column: 12, scope: !18)
!27 = !DILocation(line: 41, column: 10, scope: !18)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !19, line: 44, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 42, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 44, column: 16, scope: !29)
!33 = !DILocation(line: 44, column: 41, scope: !29)
!34 = !DILocation(line: 44, column: 26, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !29, file: !19, line: 45, type: !4)
!36 = !DILocation(line: 45, column: 16, scope: !29)
!37 = !DILocation(line: 45, column: 38, scope: !29)
!38 = !DILocation(line: 45, column: 45, scope: !29)
!39 = !DILocation(line: 45, column: 31, scope: !29)
!40 = !DILocation(line: 46, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !29, file: !19, line: 46, column: 13)
!42 = !DILocation(line: 46, column: 18, scope: !41)
!43 = !DILocation(line: 46, column: 13, scope: !29)
!44 = !DILocation(line: 46, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !19, line: 46, column: 27)
!46 = !DILocation(line: 47, column: 22, scope: !29)
!47 = !DILocation(line: 47, column: 28, scope: !29)
!48 = !DILocation(line: 47, column: 15, scope: !29)
!49 = !DILocation(line: 48, column: 27, scope: !29)
!50 = !DILocation(line: 48, column: 9, scope: !29)
!51 = !DILocation(line: 49, column: 14, scope: !29)
!52 = !DILocation(line: 49, column: 9, scope: !29)
!53 = !DILocation(line: 51, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 24, type: !55, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!4, !4}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !19, line: 24, type: !4)
!58 = !DILocation(line: 24, column: 32, scope: !54)
!59 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !19, line: 27, type: !8)
!60 = distinct !DILexicalBlock(scope: !54, file: !19, line: 26, column: 5)
!61 = !DILocation(line: 27, column: 19, scope: !60)
!62 = !DILocation(line: 27, column: 46, scope: !60)
!63 = !DILocation(line: 27, column: 35, scope: !60)
!64 = !DILocation(line: 28, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !19, line: 28, column: 13)
!66 = !DILocation(line: 28, column: 27, scope: !65)
!67 = !DILocation(line: 28, column: 13, scope: !60)
!68 = !DILocation(line: 28, column: 37, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !19, line: 28, column: 36)
!70 = !DILocation(line: 29, column: 17, scope: !60)
!71 = !DILocation(line: 29, column: 9, scope: !60)
!72 = !DILocation(line: 30, column: 9, scope: !60)
!73 = !DILocation(line: 30, column: 29, scope: !60)
!74 = !DILocation(line: 32, column: 24, scope: !60)
!75 = !DILocation(line: 32, column: 16, scope: !60)
!76 = !DILocation(line: 32, column: 14, scope: !60)
!77 = !DILocation(line: 34, column: 12, scope: !54)
!78 = !DILocation(line: 34, column: 5, scope: !54)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_42_good", scope: !19, file: !19, line: 117, type: !20, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 119, column: 5, scope: !79)
!81 = !DILocation(line: 120, column: 5, scope: !79)
!82 = !DILocation(line: 121, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 132, type: !84, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !19, line: 132, type: !11)
!88 = !DILocation(line: 132, column: 14, scope: !83)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !19, line: 132, type: !86)
!90 = !DILocation(line: 132, column: 27, scope: !83)
!91 = !DILocation(line: 135, column: 22, scope: !83)
!92 = !DILocation(line: 135, column: 12, scope: !83)
!93 = !DILocation(line: 135, column: 5, scope: !83)
!94 = !DILocation(line: 137, column: 5, scope: !83)
!95 = !DILocation(line: 138, column: 5, scope: !83)
!96 = !DILocation(line: 139, column: 5, scope: !83)
!97 = !DILocation(line: 142, column: 5, scope: !83)
!98 = !DILocation(line: 143, column: 5, scope: !83)
!99 = !DILocation(line: 144, column: 5, scope: !83)
!100 = !DILocation(line: 146, column: 5, scope: !83)
!101 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 101, type: !20, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !19, line: 103, type: !4)
!103 = !DILocation(line: 103, column: 12, scope: !101)
!104 = !DILocation(line: 104, column: 10, scope: !101)
!105 = !DILocation(line: 105, column: 26, scope: !101)
!106 = !DILocation(line: 105, column: 12, scope: !101)
!107 = !DILocation(line: 105, column: 10, scope: !101)
!108 = !DILocalVariable(name: "dataLen", scope: !109, file: !19, line: 108, type: !30)
!109 = distinct !DILexicalBlock(scope: !101, file: !19, line: 106, column: 5)
!110 = !DILocation(line: 108, column: 16, scope: !109)
!111 = !DILocation(line: 108, column: 44, scope: !109)
!112 = !DILocation(line: 108, column: 33, scope: !109)
!113 = !DILocation(line: 108, column: 26, scope: !109)
!114 = !DILocalVariable(name: "dest", scope: !109, file: !19, line: 109, type: !4)
!115 = !DILocation(line: 109, column: 16, scope: !109)
!116 = !DILocation(line: 109, column: 38, scope: !109)
!117 = !DILocation(line: 109, column: 45, scope: !109)
!118 = !DILocation(line: 109, column: 31, scope: !109)
!119 = !DILocation(line: 110, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !19, line: 110, column: 13)
!121 = !DILocation(line: 110, column: 18, scope: !120)
!122 = !DILocation(line: 110, column: 13, scope: !109)
!123 = !DILocation(line: 110, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !19, line: 110, column: 27)
!125 = !DILocation(line: 111, column: 22, scope: !109)
!126 = !DILocation(line: 111, column: 28, scope: !109)
!127 = !DILocation(line: 111, column: 15, scope: !109)
!128 = !DILocation(line: 112, column: 31, scope: !109)
!129 = !DILocation(line: 112, column: 20, scope: !109)
!130 = !DILocation(line: 112, column: 9, scope: !109)
!131 = !DILocation(line: 113, column: 14, scope: !109)
!132 = !DILocation(line: 113, column: 9, scope: !109)
!133 = !DILocation(line: 115, column: 1, scope: !101)
!134 = distinct !DISubprogram(name: "goodB2GSource", scope: !19, file: !19, line: 88, type: !55, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", arg: 1, scope: !134, file: !19, line: 88, type: !4)
!136 = !DILocation(line: 88, column: 36, scope: !134)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !19, line: 91, type: !8)
!138 = distinct !DILexicalBlock(scope: !134, file: !19, line: 90, column: 5)
!139 = !DILocation(line: 91, column: 19, scope: !138)
!140 = !DILocation(line: 91, column: 46, scope: !138)
!141 = !DILocation(line: 91, column: 35, scope: !138)
!142 = !DILocation(line: 92, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !19, line: 92, column: 13)
!144 = !DILocation(line: 92, column: 27, scope: !143)
!145 = !DILocation(line: 92, column: 13, scope: !138)
!146 = !DILocation(line: 92, column: 37, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !19, line: 92, column: 36)
!148 = !DILocation(line: 93, column: 17, scope: !138)
!149 = !DILocation(line: 93, column: 9, scope: !138)
!150 = !DILocation(line: 94, column: 9, scope: !138)
!151 = !DILocation(line: 94, column: 29, scope: !138)
!152 = !DILocation(line: 96, column: 24, scope: !138)
!153 = !DILocation(line: 96, column: 16, scope: !138)
!154 = !DILocation(line: 96, column: 14, scope: !138)
!155 = !DILocation(line: 98, column: 12, scope: !134)
!156 = !DILocation(line: 98, column: 5, scope: !134)
!157 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !19, line: 73, type: !4)
!159 = !DILocation(line: 73, column: 12, scope: !157)
!160 = !DILocation(line: 74, column: 10, scope: !157)
!161 = !DILocation(line: 75, column: 26, scope: !157)
!162 = !DILocation(line: 75, column: 12, scope: !157)
!163 = !DILocation(line: 75, column: 10, scope: !157)
!164 = !DILocalVariable(name: "dataLen", scope: !165, file: !19, line: 78, type: !30)
!165 = distinct !DILexicalBlock(scope: !157, file: !19, line: 76, column: 5)
!166 = !DILocation(line: 78, column: 16, scope: !165)
!167 = !DILocation(line: 78, column: 41, scope: !165)
!168 = !DILocation(line: 78, column: 26, scope: !165)
!169 = !DILocalVariable(name: "dest", scope: !165, file: !19, line: 79, type: !4)
!170 = !DILocation(line: 79, column: 16, scope: !165)
!171 = !DILocation(line: 79, column: 38, scope: !165)
!172 = !DILocation(line: 79, column: 45, scope: !165)
!173 = !DILocation(line: 79, column: 31, scope: !165)
!174 = !DILocation(line: 80, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !165, file: !19, line: 80, column: 13)
!176 = !DILocation(line: 80, column: 18, scope: !175)
!177 = !DILocation(line: 80, column: 13, scope: !165)
!178 = !DILocation(line: 80, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !19, line: 80, column: 27)
!180 = !DILocation(line: 81, column: 22, scope: !165)
!181 = !DILocation(line: 81, column: 28, scope: !165)
!182 = !DILocation(line: 81, column: 15, scope: !165)
!183 = !DILocation(line: 82, column: 27, scope: !165)
!184 = !DILocation(line: 82, column: 9, scope: !165)
!185 = !DILocation(line: 83, column: 14, scope: !165)
!186 = !DILocation(line: 83, column: 9, scope: !165)
!187 = !DILocation(line: 85, column: 1, scope: !157)
!188 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 58, type: !55, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!189 = !DILocalVariable(name: "data", arg: 1, scope: !188, file: !19, line: 58, type: !4)
!190 = !DILocation(line: 58, column: 36, scope: !188)
!191 = !DILocalVariable(name: "dataGoodBuffer", scope: !192, file: !19, line: 61, type: !5)
!192 = distinct !DILexicalBlock(scope: !188, file: !19, line: 60, column: 5)
!193 = !DILocation(line: 61, column: 16, scope: !192)
!194 = !DILocation(line: 61, column: 41, scope: !192)
!195 = !DILocation(line: 62, column: 13, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !19, line: 62, column: 13)
!197 = !DILocation(line: 62, column: 28, scope: !196)
!198 = !DILocation(line: 62, column: 13, scope: !192)
!199 = !DILocation(line: 62, column: 38, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !19, line: 62, column: 37)
!201 = !DILocation(line: 63, column: 16, scope: !192)
!202 = !DILocation(line: 63, column: 9, scope: !192)
!203 = !DILocation(line: 64, column: 9, scope: !192)
!204 = !DILocation(line: 64, column: 30, scope: !192)
!205 = !DILocation(line: 66, column: 24, scope: !192)
!206 = !DILocation(line: 66, column: 14, scope: !192)
!207 = !DILocation(line: 68, column: 12, scope: !188)
!208 = !DILocation(line: 68, column: 5, scope: !188)
