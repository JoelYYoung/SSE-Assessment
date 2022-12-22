; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i2 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_bad.source to i8*), i64 44, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !54, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !61
  store i64 %call3, i64* %sourceLen, align 8, !dbg !62
  store i64 0, i64* %i2, align 8, !dbg !63
  br label %for.cond4, !dbg !65

for.cond4:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !66
  %6 = load i64, i64* %sourceLen, align 8, !dbg !68
  %add = add i64 %6, 1, !dbg !69
  %cmp5 = icmp ult i64 %5, %add, !dbg !70
  br i1 %cmp5, label %for.body6, label %for.end10, !dbg !71

for.body6:                                        ; preds = %for.cond4
  %7 = load i64, i64* %i2, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !74
  %8 = load i32, i32* %arrayidx, align 4, !dbg !74
  %9 = load i32*, i32** %data, align 8, !dbg !75
  %10 = load i64, i64* %i2, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !75
  store i32 %8, i32* %arrayidx7, align 4, !dbg !77
  br label %for.inc8, !dbg !78

for.inc8:                                         ; preds = %for.body6
  %11 = load i64, i64* %i2, align 8, !dbg !79
  %inc9 = add i64 %11, 1, !dbg !79
  store i64 %inc9, i64* %i2, align 8, !dbg !79
  br label %for.cond4, !dbg !80, !llvm.loop !81

for.end10:                                        ; preds = %for.cond4
  %12 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %12), !dbg !84
  %13 = load i32*, i32** %data, align 8, !dbg !85
  %14 = bitcast i32* %13 to i8*, !dbg !85
  call void @free(i8* %14) #7, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
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
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  store i32 0, i32* %h, align 4, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !120
  %cmp = icmp slt i32 %0, 1, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !124
  %1 = bitcast i8* %call to i32*, !dbg !126
  store i32* %1, i32** %data, align 8, !dbg !127
  %2 = load i32*, i32** %data, align 8, !dbg !128
  %cmp1 = icmp eq i32* %2, null, !dbg !130
  br i1 %cmp1, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !135
  %inc = add nsw i32 %3, 1, !dbg !135
  store i32 %inc, i32* %h, align 4, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !146
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !147
  store i64 %call2, i64* %sourceLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond3, !dbg !151

for.cond3:                                        ; preds = %for.inc7, %for.end
  %5 = load i64, i64* %i, align 8, !dbg !152
  %6 = load i64, i64* %sourceLen, align 8, !dbg !154
  %add = add i64 %6, 1, !dbg !155
  %cmp4 = icmp ult i64 %5, %add, !dbg !156
  br i1 %cmp4, label %for.body5, label %for.end9, !dbg !157

for.body5:                                        ; preds = %for.cond3
  %7 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !160
  %8 = load i32, i32* %arrayidx, align 4, !dbg !160
  %9 = load i32*, i32** %data, align 8, !dbg !161
  %10 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !161
  store i32 %8, i32* %arrayidx6, align 4, !dbg !163
  br label %for.inc7, !dbg !164

for.inc7:                                         ; preds = %for.body5
  %11 = load i64, i64* %i, align 8, !dbg !165
  %inc8 = add i64 %11, 1, !dbg !165
  store i64 %inc8, i64* %i, align 8, !dbg !165
  br label %for.cond3, !dbg !166, !llvm.loop !167

for.end9:                                         ; preds = %for.cond3
  %12 = load i32*, i32** %data, align 8, !dbg !169
  call void @printWLine(i32* %12), !dbg !170
  %13 = load i32*, i32** %data, align 8, !dbg !171
  %14 = bitcast i32* %13 to i8*, !dbg !171
  call void @free(i8* %14) #7, !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 30, type: !7)
!21 = !DILocation(line: 30, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocation(line: 32, column: 10, scope: !16)
!25 = !DILocation(line: 33, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!27 = !DILocation(line: 33, column: 9, scope: !26)
!28 = !DILocation(line: 33, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 33, column: 5)
!30 = !DILocation(line: 33, column: 18, scope: !29)
!31 = !DILocation(line: 33, column: 5, scope: !26)
!32 = !DILocation(line: 36, column: 27, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 34, column: 5)
!34 = !DILocation(line: 36, column: 16, scope: !33)
!35 = !DILocation(line: 36, column: 14, scope: !33)
!36 = !DILocation(line: 37, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 37, column: 13)
!38 = !DILocation(line: 37, column: 18, scope: !37)
!39 = !DILocation(line: 37, column: 13, scope: !33)
!40 = !DILocation(line: 37, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 37, column: 27)
!42 = !DILocation(line: 38, column: 5, scope: !33)
!43 = !DILocation(line: 33, column: 24, scope: !29)
!44 = !DILocation(line: 33, column: 5, scope: !29)
!45 = distinct !{!45, !31, !46, !47}
!46 = !DILocation(line: 38, column: 5, scope: !26)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 11)
!53 = !DILocation(line: 40, column: 17, scope: !49)
!54 = !DILocalVariable(name: "i", scope: !49, file: !17, line: 41, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !56)
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 41, column: 16, scope: !49)
!58 = !DILocalVariable(name: "sourceLen", scope: !49, file: !17, line: 41, type: !55)
!59 = !DILocation(line: 41, column: 19, scope: !49)
!60 = !DILocation(line: 42, column: 28, scope: !49)
!61 = !DILocation(line: 42, column: 21, scope: !49)
!62 = !DILocation(line: 42, column: 19, scope: !49)
!63 = !DILocation(line: 45, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !49, file: !17, line: 45, column: 9)
!65 = !DILocation(line: 45, column: 14, scope: !64)
!66 = !DILocation(line: 45, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !17, line: 45, column: 9)
!68 = !DILocation(line: 45, column: 25, scope: !67)
!69 = !DILocation(line: 45, column: 35, scope: !67)
!70 = !DILocation(line: 45, column: 23, scope: !67)
!71 = !DILocation(line: 45, column: 9, scope: !64)
!72 = !DILocation(line: 47, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !17, line: 46, column: 9)
!74 = !DILocation(line: 47, column: 23, scope: !73)
!75 = !DILocation(line: 47, column: 13, scope: !73)
!76 = !DILocation(line: 47, column: 18, scope: !73)
!77 = !DILocation(line: 47, column: 21, scope: !73)
!78 = !DILocation(line: 48, column: 9, scope: !73)
!79 = !DILocation(line: 45, column: 41, scope: !67)
!80 = !DILocation(line: 45, column: 9, scope: !67)
!81 = distinct !{!81, !71, !82, !47}
!82 = !DILocation(line: 48, column: 9, scope: !64)
!83 = !DILocation(line: 49, column: 20, scope: !49)
!84 = !DILocation(line: 49, column: 9, scope: !49)
!85 = !DILocation(line: 50, column: 14, scope: !49)
!86 = !DILocation(line: 50, column: 9, scope: !49)
!87 = !DILocation(line: 52, column: 1, scope: !16)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_17_good", scope: !17, file: !17, line: 85, type: !18, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 87, column: 5, scope: !88)
!90 = !DILocation(line: 88, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 100, type: !92, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 100, type: !7)
!98 = !DILocation(line: 100, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 100, type: !94)
!100 = !DILocation(line: 100, column: 27, scope: !91)
!101 = !DILocation(line: 103, column: 22, scope: !91)
!102 = !DILocation(line: 103, column: 12, scope: !91)
!103 = !DILocation(line: 103, column: 5, scope: !91)
!104 = !DILocation(line: 105, column: 5, scope: !91)
!105 = !DILocation(line: 106, column: 5, scope: !91)
!106 = !DILocation(line: 107, column: 5, scope: !91)
!107 = !DILocation(line: 110, column: 5, scope: !91)
!108 = !DILocation(line: 111, column: 5, scope: !91)
!109 = !DILocation(line: 112, column: 5, scope: !91)
!110 = !DILocation(line: 114, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "h", scope: !111, file: !17, line: 61, type: !7)
!113 = !DILocation(line: 61, column: 9, scope: !111)
!114 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 62, type: !4)
!115 = !DILocation(line: 62, column: 15, scope: !111)
!116 = !DILocation(line: 63, column: 10, scope: !111)
!117 = !DILocation(line: 64, column: 11, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !17, line: 64, column: 5)
!119 = !DILocation(line: 64, column: 9, scope: !118)
!120 = !DILocation(line: 64, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !17, line: 64, column: 5)
!122 = !DILocation(line: 64, column: 18, scope: !121)
!123 = !DILocation(line: 64, column: 5, scope: !118)
!124 = !DILocation(line: 67, column: 27, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !17, line: 65, column: 5)
!126 = !DILocation(line: 67, column: 16, scope: !125)
!127 = !DILocation(line: 67, column: 14, scope: !125)
!128 = !DILocation(line: 68, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 68, column: 13)
!130 = !DILocation(line: 68, column: 18, scope: !129)
!131 = !DILocation(line: 68, column: 13, scope: !125)
!132 = !DILocation(line: 68, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 68, column: 27)
!134 = !DILocation(line: 69, column: 5, scope: !125)
!135 = !DILocation(line: 64, column: 24, scope: !121)
!136 = !DILocation(line: 64, column: 5, scope: !121)
!137 = distinct !{!137, !123, !138, !47}
!138 = !DILocation(line: 69, column: 5, scope: !118)
!139 = !DILocalVariable(name: "source", scope: !140, file: !17, line: 71, type: !50)
!140 = distinct !DILexicalBlock(scope: !111, file: !17, line: 70, column: 5)
!141 = !DILocation(line: 71, column: 17, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !140, file: !17, line: 72, type: !55)
!143 = !DILocation(line: 72, column: 16, scope: !140)
!144 = !DILocalVariable(name: "sourceLen", scope: !140, file: !17, line: 72, type: !55)
!145 = !DILocation(line: 72, column: 19, scope: !140)
!146 = !DILocation(line: 73, column: 28, scope: !140)
!147 = !DILocation(line: 73, column: 21, scope: !140)
!148 = !DILocation(line: 73, column: 19, scope: !140)
!149 = !DILocation(line: 76, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !140, file: !17, line: 76, column: 9)
!151 = !DILocation(line: 76, column: 14, scope: !150)
!152 = !DILocation(line: 76, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 76, column: 9)
!154 = !DILocation(line: 76, column: 25, scope: !153)
!155 = !DILocation(line: 76, column: 35, scope: !153)
!156 = !DILocation(line: 76, column: 23, scope: !153)
!157 = !DILocation(line: 76, column: 9, scope: !150)
!158 = !DILocation(line: 78, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !17, line: 77, column: 9)
!160 = !DILocation(line: 78, column: 23, scope: !159)
!161 = !DILocation(line: 78, column: 13, scope: !159)
!162 = !DILocation(line: 78, column: 18, scope: !159)
!163 = !DILocation(line: 78, column: 21, scope: !159)
!164 = !DILocation(line: 79, column: 9, scope: !159)
!165 = !DILocation(line: 76, column: 41, scope: !153)
!166 = !DILocation(line: 76, column: 9, scope: !153)
!167 = distinct !{!167, !157, !168, !47}
!168 = !DILocation(line: 79, column: 9, scope: !150)
!169 = !DILocation(line: 80, column: 20, scope: !140)
!170 = !DILocation(line: 80, column: 9, scope: !140)
!171 = !DILocation(line: 81, column: 14, scope: !140)
!172 = !DILocation(line: 81, column: 9, scope: !140)
!173 = !DILocation(line: 83, column: 1, scope: !111)
