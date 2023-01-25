; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_16_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !39
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  %5 = bitcast i32* %4 to i8*, !dbg !43
  store i8* %5, i8** %data, align 8, !dbg !44
  br label %while.end, !dbg !45

while.end:                                        ; preds = %if.end
  br label %while.body2, !dbg !46

while.body2:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  %call3 = call i64 @strlen(i8* %6) #9, !dbg !54
  store i64 %call3, i64* %dataLen, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !55, metadata !DIExpression()), !dbg !56
  %7 = load i64, i64* %dataLen, align 8, !dbg !57
  %add = add i64 %7, 1, !dbg !58
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !59
  store i8* %call4, i8** %dest, align 8, !dbg !56
  %8 = load i8*, i8** %dest, align 8, !dbg !60
  %cmp5 = icmp eq i8* %8, null, !dbg !62
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !63

if.then6:                                         ; preds = %while.body2
  call void @exit(i32 -1) #8, !dbg !64
  unreachable, !dbg !64

if.end7:                                          ; preds = %while.body2
  %9 = load i8*, i8** %dest, align 8, !dbg !66
  %10 = bitcast i8* %9 to i32*, !dbg !66
  %11 = load i8*, i8** %data, align 8, !dbg !67
  %12 = bitcast i8* %11 to i32*, !dbg !67
  %call8 = call i32* @wcscpy(i32* %10, i32* %12) #7, !dbg !68
  %13 = load i8*, i8** %dest, align 8, !dbg !69
  call void @printLine(i8* %13), !dbg !70
  %14 = load i8*, i8** %dest, align 8, !dbg !71
  call void @free(i8* %14) #7, !dbg !72
  br label %while.end9, !dbg !73

while.end9:                                       ; preds = %if.end7
  ret void, !dbg !74
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_16_good() #0 !dbg !75 {
entry:
  call void @goodB2G(), !dbg !76
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_16_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_16_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  br label %while.body, !dbg !101

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !105
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !114
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !115
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !118
  %5 = bitcast i32* %4 to i8*, !dbg !119
  store i8* %5, i8** %data, align 8, !dbg !120
  br label %while.end, !dbg !121

while.end:                                        ; preds = %if.end
  br label %while.body2, !dbg !122

while.body2:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !123, metadata !DIExpression()), !dbg !126
  %6 = load i8*, i8** %data, align 8, !dbg !127
  %7 = bitcast i8* %6 to i32*, !dbg !128
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !129
  store i64 %call3, i64* %dataLen, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !130, metadata !DIExpression()), !dbg !131
  %8 = load i64, i64* %dataLen, align 8, !dbg !132
  %add = add i64 %8, 1, !dbg !133
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !134
  store i8* %call4, i8** %dest, align 8, !dbg !131
  %9 = load i8*, i8** %dest, align 8, !dbg !135
  %cmp5 = icmp eq i8* %9, null, !dbg !137
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !138

if.then6:                                         ; preds = %while.body2
  call void @exit(i32 -1) #8, !dbg !139
  unreachable, !dbg !139

if.end7:                                          ; preds = %while.body2
  %10 = load i8*, i8** %dest, align 8, !dbg !141
  %11 = bitcast i8* %10 to i32*, !dbg !141
  %12 = load i8*, i8** %data, align 8, !dbg !142
  %13 = bitcast i8* %12 to i32*, !dbg !142
  %call8 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !143
  %14 = load i8*, i8** %dest, align 8, !dbg !144
  %15 = bitcast i8* %14 to i32*, !dbg !145
  call void @printWLine(i32* %15), !dbg !146
  %16 = load i8*, i8** %dest, align 8, !dbg !147
  call void @free(i8* %16) #7, !dbg !148
  br label %while.end9, !dbg !149

while.end9:                                       ; preds = %if.end7
  ret void, !dbg !150
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i8* null, i8** %data, align 8, !dbg !154
  br label %while.body, !dbg !155

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !159
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !160
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !159
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !161
  %cmp = icmp eq i8* %0, null, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !165
  unreachable, !dbg !165

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !168
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !171
  store i8* %3, i8** %data, align 8, !dbg !172
  br label %while.end, !dbg !173

while.end:                                        ; preds = %if.end
  br label %while.body1, !dbg !174

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !175, metadata !DIExpression()), !dbg !178
  %4 = load i8*, i8** %data, align 8, !dbg !179
  %call2 = call i64 @strlen(i8* %4) #9, !dbg !180
  store i64 %call2, i64* %dataLen, align 8, !dbg !178
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !181, metadata !DIExpression()), !dbg !182
  %5 = load i64, i64* %dataLen, align 8, !dbg !183
  %add = add i64 %5, 1, !dbg !184
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !185
  store i8* %call3, i8** %dest, align 8, !dbg !182
  %6 = load i8*, i8** %dest, align 8, !dbg !186
  %cmp4 = icmp eq i8* %6, null, !dbg !188
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !189

if.then5:                                         ; preds = %while.body1
  call void @exit(i32 -1) #8, !dbg !190
  unreachable, !dbg !190

if.end6:                                          ; preds = %while.body1
  %7 = load i8*, i8** %dest, align 8, !dbg !192
  %8 = load i8*, i8** %data, align 8, !dbg !193
  %call7 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !194
  %9 = load i8*, i8** %dest, align 8, !dbg !195
  call void @printLine(i8* %9), !dbg !196
  %10 = load i8*, i8** %dest, align 8, !dbg !197
  call void @free(i8* %10) #7, !dbg !198
  br label %while.end8, !dbg !199

while.end8:                                       ; preds = %if.end6
  ret void, !dbg !200
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_16_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_16.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocation(line: 28, column: 5, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !27, file: !19, line: 31, type: !5)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 30, column: 9)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 5)
!29 = !DILocation(line: 31, column: 23, scope: !27)
!30 = !DILocation(line: 31, column: 50, scope: !27)
!31 = !DILocation(line: 31, column: 39, scope: !27)
!32 = !DILocation(line: 32, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !19, line: 32, column: 17)
!34 = !DILocation(line: 32, column: 31, scope: !33)
!35 = !DILocation(line: 32, column: 17, scope: !27)
!36 = !DILocation(line: 32, column: 41, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 32, column: 40)
!38 = !DILocation(line: 33, column: 21, scope: !27)
!39 = !DILocation(line: 33, column: 13, scope: !27)
!40 = !DILocation(line: 34, column: 13, scope: !27)
!41 = !DILocation(line: 34, column: 33, scope: !27)
!42 = !DILocation(line: 36, column: 28, scope: !27)
!43 = !DILocation(line: 36, column: 20, scope: !27)
!44 = !DILocation(line: 36, column: 18, scope: !27)
!45 = !DILocation(line: 38, column: 9, scope: !28)
!46 = !DILocation(line: 40, column: 5, scope: !18)
!47 = !DILocalVariable(name: "dataLen", scope: !48, file: !19, line: 44, type: !50)
!48 = distinct !DILexicalBlock(scope: !49, file: !19, line: 42, column: 9)
!49 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 44, column: 20, scope: !48)
!53 = !DILocation(line: 44, column: 45, scope: !48)
!54 = !DILocation(line: 44, column: 30, scope: !48)
!55 = !DILocalVariable(name: "dest", scope: !48, file: !19, line: 45, type: !4)
!56 = !DILocation(line: 45, column: 20, scope: !48)
!57 = !DILocation(line: 45, column: 42, scope: !48)
!58 = !DILocation(line: 45, column: 49, scope: !48)
!59 = !DILocation(line: 45, column: 35, scope: !48)
!60 = !DILocation(line: 46, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !48, file: !19, line: 46, column: 17)
!62 = !DILocation(line: 46, column: 22, scope: !61)
!63 = !DILocation(line: 46, column: 17, scope: !48)
!64 = !DILocation(line: 46, column: 32, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !19, line: 46, column: 31)
!66 = !DILocation(line: 47, column: 26, scope: !48)
!67 = !DILocation(line: 47, column: 32, scope: !48)
!68 = !DILocation(line: 47, column: 19, scope: !48)
!69 = !DILocation(line: 48, column: 31, scope: !48)
!70 = !DILocation(line: 48, column: 13, scope: !48)
!71 = !DILocation(line: 49, column: 18, scope: !48)
!72 = !DILocation(line: 49, column: 13, scope: !48)
!73 = !DILocation(line: 51, column: 9, scope: !49)
!74 = !DILocation(line: 53, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_16_good", scope: !19, file: !19, line: 123, type: !20, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 125, column: 5, scope: !75)
!77 = !DILocation(line: 126, column: 5, scope: !75)
!78 = !DILocation(line: 127, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 138, type: !80, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!8, !8, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !19, line: 138, type: !8)
!84 = !DILocation(line: 138, column: 14, scope: !79)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !19, line: 138, type: !82)
!86 = !DILocation(line: 138, column: 27, scope: !79)
!87 = !DILocation(line: 141, column: 22, scope: !79)
!88 = !DILocation(line: 141, column: 12, scope: !79)
!89 = !DILocation(line: 141, column: 5, scope: !79)
!90 = !DILocation(line: 143, column: 5, scope: !79)
!91 = !DILocation(line: 144, column: 5, scope: !79)
!92 = !DILocation(line: 145, column: 5, scope: !79)
!93 = !DILocation(line: 148, column: 5, scope: !79)
!94 = !DILocation(line: 149, column: 5, scope: !79)
!95 = !DILocation(line: 150, column: 5, scope: !79)
!96 = !DILocation(line: 152, column: 5, scope: !79)
!97 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 62, type: !4)
!99 = !DILocation(line: 62, column: 12, scope: !97)
!100 = !DILocation(line: 63, column: 10, scope: !97)
!101 = !DILocation(line: 64, column: 5, scope: !97)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !19, line: 67, type: !5)
!103 = distinct !DILexicalBlock(scope: !104, file: !19, line: 66, column: 9)
!104 = distinct !DILexicalBlock(scope: !97, file: !19, line: 65, column: 5)
!105 = !DILocation(line: 67, column: 23, scope: !103)
!106 = !DILocation(line: 67, column: 50, scope: !103)
!107 = !DILocation(line: 67, column: 39, scope: !103)
!108 = !DILocation(line: 68, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !19, line: 68, column: 17)
!110 = !DILocation(line: 68, column: 31, scope: !109)
!111 = !DILocation(line: 68, column: 17, scope: !103)
!112 = !DILocation(line: 68, column: 41, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !19, line: 68, column: 40)
!114 = !DILocation(line: 69, column: 21, scope: !103)
!115 = !DILocation(line: 69, column: 13, scope: !103)
!116 = !DILocation(line: 70, column: 13, scope: !103)
!117 = !DILocation(line: 70, column: 33, scope: !103)
!118 = !DILocation(line: 72, column: 28, scope: !103)
!119 = !DILocation(line: 72, column: 20, scope: !103)
!120 = !DILocation(line: 72, column: 18, scope: !103)
!121 = !DILocation(line: 74, column: 9, scope: !104)
!122 = !DILocation(line: 76, column: 5, scope: !97)
!123 = !DILocalVariable(name: "dataLen", scope: !124, file: !19, line: 80, type: !50)
!124 = distinct !DILexicalBlock(scope: !125, file: !19, line: 78, column: 9)
!125 = distinct !DILexicalBlock(scope: !97, file: !19, line: 77, column: 5)
!126 = !DILocation(line: 80, column: 20, scope: !124)
!127 = !DILocation(line: 80, column: 48, scope: !124)
!128 = !DILocation(line: 80, column: 37, scope: !124)
!129 = !DILocation(line: 80, column: 30, scope: !124)
!130 = !DILocalVariable(name: "dest", scope: !124, file: !19, line: 81, type: !4)
!131 = !DILocation(line: 81, column: 20, scope: !124)
!132 = !DILocation(line: 81, column: 42, scope: !124)
!133 = !DILocation(line: 81, column: 49, scope: !124)
!134 = !DILocation(line: 81, column: 35, scope: !124)
!135 = !DILocation(line: 82, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !124, file: !19, line: 82, column: 17)
!137 = !DILocation(line: 82, column: 22, scope: !136)
!138 = !DILocation(line: 82, column: 17, scope: !124)
!139 = !DILocation(line: 82, column: 32, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !19, line: 82, column: 31)
!141 = !DILocation(line: 83, column: 26, scope: !124)
!142 = !DILocation(line: 83, column: 32, scope: !124)
!143 = !DILocation(line: 83, column: 19, scope: !124)
!144 = !DILocation(line: 84, column: 35, scope: !124)
!145 = !DILocation(line: 84, column: 24, scope: !124)
!146 = !DILocation(line: 84, column: 13, scope: !124)
!147 = !DILocation(line: 85, column: 18, scope: !124)
!148 = !DILocation(line: 85, column: 13, scope: !124)
!149 = !DILocation(line: 87, column: 9, scope: !125)
!150 = !DILocation(line: 89, column: 1, scope: !97)
!151 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !19, line: 94, type: !4)
!153 = !DILocation(line: 94, column: 12, scope: !151)
!154 = !DILocation(line: 95, column: 10, scope: !151)
!155 = !DILocation(line: 96, column: 5, scope: !151)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !157, file: !19, line: 99, type: !9)
!157 = distinct !DILexicalBlock(scope: !158, file: !19, line: 98, column: 9)
!158 = distinct !DILexicalBlock(scope: !151, file: !19, line: 97, column: 5)
!159 = !DILocation(line: 99, column: 20, scope: !157)
!160 = !DILocation(line: 99, column: 45, scope: !157)
!161 = !DILocation(line: 100, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !19, line: 100, column: 17)
!163 = !DILocation(line: 100, column: 32, scope: !162)
!164 = !DILocation(line: 100, column: 17, scope: !157)
!165 = !DILocation(line: 100, column: 42, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !19, line: 100, column: 41)
!167 = !DILocation(line: 101, column: 20, scope: !157)
!168 = !DILocation(line: 101, column: 13, scope: !157)
!169 = !DILocation(line: 102, column: 13, scope: !157)
!170 = !DILocation(line: 102, column: 34, scope: !157)
!171 = !DILocation(line: 104, column: 28, scope: !157)
!172 = !DILocation(line: 104, column: 18, scope: !157)
!173 = !DILocation(line: 106, column: 9, scope: !158)
!174 = !DILocation(line: 108, column: 5, scope: !151)
!175 = !DILocalVariable(name: "dataLen", scope: !176, file: !19, line: 112, type: !50)
!176 = distinct !DILexicalBlock(scope: !177, file: !19, line: 110, column: 9)
!177 = distinct !DILexicalBlock(scope: !151, file: !19, line: 109, column: 5)
!178 = !DILocation(line: 112, column: 20, scope: !176)
!179 = !DILocation(line: 112, column: 45, scope: !176)
!180 = !DILocation(line: 112, column: 30, scope: !176)
!181 = !DILocalVariable(name: "dest", scope: !176, file: !19, line: 113, type: !4)
!182 = !DILocation(line: 113, column: 20, scope: !176)
!183 = !DILocation(line: 113, column: 42, scope: !176)
!184 = !DILocation(line: 113, column: 49, scope: !176)
!185 = !DILocation(line: 113, column: 35, scope: !176)
!186 = !DILocation(line: 114, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !176, file: !19, line: 114, column: 17)
!188 = !DILocation(line: 114, column: 22, scope: !187)
!189 = !DILocation(line: 114, column: 17, scope: !176)
!190 = !DILocation(line: 114, column: 32, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !19, line: 114, column: 31)
!192 = !DILocation(line: 115, column: 26, scope: !176)
!193 = !DILocation(line: 115, column: 32, scope: !176)
!194 = !DILocation(line: 115, column: 19, scope: !176)
!195 = !DILocation(line: 116, column: 31, scope: !176)
!196 = !DILocation(line: 116, column: 13, scope: !176)
!197 = !DILocation(line: 117, column: 18, scope: !176)
!198 = !DILocation(line: 117, column: 13, scope: !176)
!199 = !DILocation(line: 119, column: 9, scope: !177)
!200 = !DILocation(line: 121, column: 1, scope: !151)
