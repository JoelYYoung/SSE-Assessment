; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_41_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !37
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %5 = bitcast i32* %4 to i8*, !dbg !41
  store i8* %5, i8** %data, align 8, !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @badSink(i8* %6), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !55
  %0 = load i8*, i8** %data.addr, align 8, !dbg !56
  %call = call i64 @strlen(i8* %0) #9, !dbg !57
  store i64 %call, i64* %dataLen, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !58, metadata !DIExpression()), !dbg !59
  %1 = load i64, i64* %dataLen, align 8, !dbg !60
  %add = add i64 %1, 1, !dbg !61
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !62
  store i8* %call1, i8** %dest, align 8, !dbg !59
  %2 = load i8*, i8** %dest, align 8, !dbg !63
  %cmp = icmp eq i8* %2, null, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !67
  unreachable, !dbg !67

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dest, align 8, !dbg !69
  %4 = bitcast i8* %3 to i32*, !dbg !69
  %5 = load i8*, i8** %data.addr, align 8, !dbg !70
  %6 = bitcast i8* %5 to i32*, !dbg !70
  %call2 = call i32* @wcscpy(i32* %4, i32* %6) #7, !dbg !71
  %7 = load i8*, i8** %dest, align 8, !dbg !72
  call void @printLine(i8* %7), !dbg !73
  %8 = load i8*, i8** %dest, align 8, !dbg !74
  call void @free(i8* %8) #7, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_41_good() #0 !dbg !77 {
entry:
  call void @goodB2G(), !dbg !78
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_41_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_41_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !105
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !114
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !115
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !118
  %5 = bitcast i32* %4 to i8*, !dbg !119
  store i8* %5, i8** %data, align 8, !dbg !120
  %6 = load i8*, i8** %data, align 8, !dbg !121
  call void @goodB2GSink(i8* %6), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i8* %data) #0 !dbg !124 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !129
  %0 = load i8*, i8** %data.addr, align 8, !dbg !130
  %1 = bitcast i8* %0 to i32*, !dbg !131
  %call = call i64 @wcslen(i32* %1) #9, !dbg !132
  store i64 %call, i64* %dataLen, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !133, metadata !DIExpression()), !dbg !134
  %2 = load i64, i64* %dataLen, align 8, !dbg !135
  %add = add i64 %2, 1, !dbg !136
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !137
  store i8* %call1, i8** %dest, align 8, !dbg !134
  %3 = load i8*, i8** %dest, align 8, !dbg !138
  %cmp = icmp eq i8* %3, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !144
  %5 = bitcast i8* %4 to i32*, !dbg !144
  %6 = load i8*, i8** %data.addr, align 8, !dbg !145
  %7 = bitcast i8* %6 to i32*, !dbg !145
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !146
  %8 = load i8*, i8** %dest, align 8, !dbg !147
  %9 = bitcast i8* %8 to i32*, !dbg !148
  call void @printWLine(i32* %9), !dbg !149
  %10 = load i8*, i8** %dest, align 8, !dbg !150
  call void @free(i8* %10) #7, !dbg !151
  ret void, !dbg !152
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  store i8* null, i8** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !157, metadata !DIExpression()), !dbg !159
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !160
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !159
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !161
  %cmp = icmp eq i8* %0, null, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !165
  unreachable, !dbg !165

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !168
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !171
  store i8* %3, i8** %data, align 8, !dbg !172
  %4 = load i8*, i8** %data, align 8, !dbg !173
  call void @goodG2BSink(i8* %4), !dbg !174
  ret void, !dbg !175
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !176 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !179, metadata !DIExpression()), !dbg !181
  %0 = load i8*, i8** %data.addr, align 8, !dbg !182
  %call = call i64 @strlen(i8* %0) #9, !dbg !183
  store i64 %call, i64* %dataLen, align 8, !dbg !181
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !184, metadata !DIExpression()), !dbg !185
  %1 = load i64, i64* %dataLen, align 8, !dbg !186
  %add = add i64 %1, 1, !dbg !187
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !188
  store i8* %call1, i8** %dest, align 8, !dbg !185
  %2 = load i8*, i8** %dest, align 8, !dbg !189
  %cmp = icmp eq i8* %2, null, !dbg !191
  br i1 %cmp, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !193
  unreachable, !dbg !193

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dest, align 8, !dbg !195
  %4 = load i8*, i8** %data.addr, align 8, !dbg !196
  %call2 = call i8* @strcpy(i8* %3, i8* %4) #7, !dbg !197
  %5 = load i8*, i8** %dest, align 8, !dbg !198
  call void @printLine(i8* %5), !dbg !199
  %6 = load i8*, i8** %dest, align 8, !dbg !200
  call void @free(i8* %6) #7, !dbg !201
  ret void, !dbg !202
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_41_bad", scope: !19, file: !19, line: 37, type: !20, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_41.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 39, type: !4)
!23 = !DILocation(line: 39, column: 12, scope: !18)
!24 = !DILocation(line: 40, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !26, file: !19, line: 42, type: !5)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 5)
!27 = !DILocation(line: 42, column: 19, scope: !26)
!28 = !DILocation(line: 42, column: 46, scope: !26)
!29 = !DILocation(line: 42, column: 35, scope: !26)
!30 = !DILocation(line: 43, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !19, line: 43, column: 13)
!32 = !DILocation(line: 43, column: 27, scope: !31)
!33 = !DILocation(line: 43, column: 13, scope: !26)
!34 = !DILocation(line: 43, column: 37, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 43, column: 36)
!36 = !DILocation(line: 44, column: 17, scope: !26)
!37 = !DILocation(line: 44, column: 9, scope: !26)
!38 = !DILocation(line: 45, column: 9, scope: !26)
!39 = !DILocation(line: 45, column: 29, scope: !26)
!40 = !DILocation(line: 47, column: 24, scope: !26)
!41 = !DILocation(line: 47, column: 16, scope: !26)
!42 = !DILocation(line: 47, column: 14, scope: !26)
!43 = !DILocation(line: 49, column: 13, scope: !18)
!44 = !DILocation(line: 49, column: 5, scope: !18)
!45 = !DILocation(line: 50, column: 1, scope: !18)
!46 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 24, type: !47, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !4}
!49 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !19, line: 24, type: !4)
!50 = !DILocation(line: 24, column: 28, scope: !46)
!51 = !DILocalVariable(name: "dataLen", scope: !52, file: !19, line: 28, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !19, line: 26, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 28, column: 16, scope: !52)
!56 = !DILocation(line: 28, column: 41, scope: !52)
!57 = !DILocation(line: 28, column: 26, scope: !52)
!58 = !DILocalVariable(name: "dest", scope: !52, file: !19, line: 29, type: !4)
!59 = !DILocation(line: 29, column: 16, scope: !52)
!60 = !DILocation(line: 29, column: 38, scope: !52)
!61 = !DILocation(line: 29, column: 45, scope: !52)
!62 = !DILocation(line: 29, column: 31, scope: !52)
!63 = !DILocation(line: 30, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !52, file: !19, line: 30, column: 13)
!65 = !DILocation(line: 30, column: 18, scope: !64)
!66 = !DILocation(line: 30, column: 13, scope: !52)
!67 = !DILocation(line: 30, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !19, line: 30, column: 27)
!69 = !DILocation(line: 31, column: 22, scope: !52)
!70 = !DILocation(line: 31, column: 28, scope: !52)
!71 = !DILocation(line: 31, column: 15, scope: !52)
!72 = !DILocation(line: 32, column: 27, scope: !52)
!73 = !DILocation(line: 32, column: 9, scope: !52)
!74 = !DILocation(line: 33, column: 14, scope: !52)
!75 = !DILocation(line: 33, column: 9, scope: !52)
!76 = !DILocation(line: 35, column: 1, scope: !46)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_41_good", scope: !19, file: !19, line: 114, type: !20, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 116, column: 5, scope: !77)
!79 = !DILocation(line: 117, column: 5, scope: !77)
!80 = !DILocation(line: 118, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 129, type: !82, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!8, !8, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !19, line: 129, type: !8)
!86 = !DILocation(line: 129, column: 14, scope: !81)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !19, line: 129, type: !84)
!88 = !DILocation(line: 129, column: 27, scope: !81)
!89 = !DILocation(line: 132, column: 22, scope: !81)
!90 = !DILocation(line: 132, column: 12, scope: !81)
!91 = !DILocation(line: 132, column: 5, scope: !81)
!92 = !DILocation(line: 134, column: 5, scope: !81)
!93 = !DILocation(line: 135, column: 5, scope: !81)
!94 = !DILocation(line: 136, column: 5, scope: !81)
!95 = !DILocation(line: 139, column: 5, scope: !81)
!96 = !DILocation(line: 140, column: 5, scope: !81)
!97 = !DILocation(line: 141, column: 5, scope: !81)
!98 = !DILocation(line: 143, column: 5, scope: !81)
!99 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 99, type: !20, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !19, line: 101, type: !4)
!101 = !DILocation(line: 101, column: 12, scope: !99)
!102 = !DILocation(line: 102, column: 10, scope: !99)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !19, line: 104, type: !5)
!104 = distinct !DILexicalBlock(scope: !99, file: !19, line: 103, column: 5)
!105 = !DILocation(line: 104, column: 19, scope: !104)
!106 = !DILocation(line: 104, column: 46, scope: !104)
!107 = !DILocation(line: 104, column: 35, scope: !104)
!108 = !DILocation(line: 105, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !19, line: 105, column: 13)
!110 = !DILocation(line: 105, column: 27, scope: !109)
!111 = !DILocation(line: 105, column: 13, scope: !104)
!112 = !DILocation(line: 105, column: 37, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !19, line: 105, column: 36)
!114 = !DILocation(line: 106, column: 17, scope: !104)
!115 = !DILocation(line: 106, column: 9, scope: !104)
!116 = !DILocation(line: 107, column: 9, scope: !104)
!117 = !DILocation(line: 107, column: 29, scope: !104)
!118 = !DILocation(line: 109, column: 24, scope: !104)
!119 = !DILocation(line: 109, column: 16, scope: !104)
!120 = !DILocation(line: 109, column: 14, scope: !104)
!121 = !DILocation(line: 111, column: 17, scope: !99)
!122 = !DILocation(line: 111, column: 5, scope: !99)
!123 = !DILocation(line: 112, column: 1, scope: !99)
!124 = distinct !DISubprogram(name: "goodB2GSink", scope: !19, file: !19, line: 86, type: !47, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", arg: 1, scope: !124, file: !19, line: 86, type: !4)
!126 = !DILocation(line: 86, column: 32, scope: !124)
!127 = !DILocalVariable(name: "dataLen", scope: !128, file: !19, line: 90, type: !53)
!128 = distinct !DILexicalBlock(scope: !124, file: !19, line: 88, column: 5)
!129 = !DILocation(line: 90, column: 16, scope: !128)
!130 = !DILocation(line: 90, column: 44, scope: !128)
!131 = !DILocation(line: 90, column: 33, scope: !128)
!132 = !DILocation(line: 90, column: 26, scope: !128)
!133 = !DILocalVariable(name: "dest", scope: !128, file: !19, line: 91, type: !4)
!134 = !DILocation(line: 91, column: 16, scope: !128)
!135 = !DILocation(line: 91, column: 38, scope: !128)
!136 = !DILocation(line: 91, column: 45, scope: !128)
!137 = !DILocation(line: 91, column: 31, scope: !128)
!138 = !DILocation(line: 92, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !128, file: !19, line: 92, column: 13)
!140 = !DILocation(line: 92, column: 18, scope: !139)
!141 = !DILocation(line: 92, column: 13, scope: !128)
!142 = !DILocation(line: 92, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !19, line: 92, column: 27)
!144 = !DILocation(line: 93, column: 22, scope: !128)
!145 = !DILocation(line: 93, column: 28, scope: !128)
!146 = !DILocation(line: 93, column: 15, scope: !128)
!147 = !DILocation(line: 94, column: 31, scope: !128)
!148 = !DILocation(line: 94, column: 20, scope: !128)
!149 = !DILocation(line: 94, column: 9, scope: !128)
!150 = !DILocation(line: 95, column: 14, scope: !128)
!151 = !DILocation(line: 95, column: 9, scope: !128)
!152 = !DILocation(line: 97, column: 1, scope: !124)
!153 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !19, line: 72, type: !4)
!155 = !DILocation(line: 72, column: 12, scope: !153)
!156 = !DILocation(line: 73, column: 10, scope: !153)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !158, file: !19, line: 75, type: !10)
!158 = distinct !DILexicalBlock(scope: !153, file: !19, line: 74, column: 5)
!159 = !DILocation(line: 75, column: 16, scope: !158)
!160 = !DILocation(line: 75, column: 41, scope: !158)
!161 = !DILocation(line: 76, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !19, line: 76, column: 13)
!163 = !DILocation(line: 76, column: 28, scope: !162)
!164 = !DILocation(line: 76, column: 13, scope: !158)
!165 = !DILocation(line: 76, column: 38, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !19, line: 76, column: 37)
!167 = !DILocation(line: 77, column: 16, scope: !158)
!168 = !DILocation(line: 77, column: 9, scope: !158)
!169 = !DILocation(line: 78, column: 9, scope: !158)
!170 = !DILocation(line: 78, column: 30, scope: !158)
!171 = !DILocation(line: 80, column: 24, scope: !158)
!172 = !DILocation(line: 80, column: 14, scope: !158)
!173 = !DILocation(line: 82, column: 17, scope: !153)
!174 = !DILocation(line: 82, column: 5, scope: !153)
!175 = !DILocation(line: 83, column: 1, scope: !153)
!176 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 57, type: !47, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!177 = !DILocalVariable(name: "data", arg: 1, scope: !176, file: !19, line: 57, type: !4)
!178 = !DILocation(line: 57, column: 32, scope: !176)
!179 = !DILocalVariable(name: "dataLen", scope: !180, file: !19, line: 61, type: !53)
!180 = distinct !DILexicalBlock(scope: !176, file: !19, line: 59, column: 5)
!181 = !DILocation(line: 61, column: 16, scope: !180)
!182 = !DILocation(line: 61, column: 41, scope: !180)
!183 = !DILocation(line: 61, column: 26, scope: !180)
!184 = !DILocalVariable(name: "dest", scope: !180, file: !19, line: 62, type: !4)
!185 = !DILocation(line: 62, column: 16, scope: !180)
!186 = !DILocation(line: 62, column: 38, scope: !180)
!187 = !DILocation(line: 62, column: 45, scope: !180)
!188 = !DILocation(line: 62, column: 31, scope: !180)
!189 = !DILocation(line: 63, column: 13, scope: !190)
!190 = distinct !DILexicalBlock(scope: !180, file: !19, line: 63, column: 13)
!191 = !DILocation(line: 63, column: 18, scope: !190)
!192 = !DILocation(line: 63, column: 13, scope: !180)
!193 = !DILocation(line: 63, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !19, line: 63, column: 27)
!195 = !DILocation(line: 64, column: 22, scope: !180)
!196 = !DILocation(line: 64, column: 28, scope: !180)
!197 = !DILocation(line: 64, column: 15, scope: !180)
!198 = !DILocation(line: 65, column: 27, scope: !180)
!199 = !DILocation(line: 65, column: 9, scope: !180)
!200 = !DILocation(line: 66, column: 14, scope: !180)
!201 = !DILocation(line: 66, column: 9, scope: !180)
!202 = !DILocation(line: 68, column: 1, scope: !176)
