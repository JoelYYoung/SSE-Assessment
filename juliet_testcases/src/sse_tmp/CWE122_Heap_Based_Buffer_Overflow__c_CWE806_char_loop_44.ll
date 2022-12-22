; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  call void %3(i8* %4), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !54, metadata !DIExpression()), !dbg !55
  %1 = load i8*, i8** %data.addr, align 8, !dbg !56
  %call = call i64 @strlen(i8* %1) #9, !dbg !57
  store i64 %call, i64* %dataLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !62
  %3 = load i64, i64* %dataLen, align 8, !dbg !64
  %cmp = icmp ult i64 %2, %3, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !67
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !67
  %6 = load i8, i8* %arrayidx, align 1, !dbg !67
  %7 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !71
  store i8 %6, i8* %arrayidx1, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %8, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !79
  store i8 0, i8* %arrayidx2, align 1, !dbg !80
  %9 = load i8*, i8** %data.addr, align 8, !dbg !81
  call void @printLine(i8* %9), !dbg !82
  %10 = load i8*, i8** %data.addr, align 8, !dbg !83
  call void @free(i8* %10) #7, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !111, metadata !DIExpression()), !dbg !112
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  call void %3(i8* %4), !dbg !125
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !128 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !136, metadata !DIExpression()), !dbg !137
  %1 = load i8*, i8** %data.addr, align 8, !dbg !138
  %call = call i64 @strlen(i8* %1) #9, !dbg !139
  store i64 %call, i64* %dataLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !144
  %3 = load i64, i64* %dataLen, align 8, !dbg !146
  %cmp = icmp ult i64 %2, %3, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !149
  %5 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !149
  %6 = load i8, i8* %arrayidx, align 1, !dbg !149
  %7 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !153
  store i8 %6, i8* %arrayidx1, align 1, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %8, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !160
  store i8 0, i8* %arrayidx2, align 1, !dbg !161
  %9 = load i8*, i8** %data.addr, align 8, !dbg !162
  call void @printLine(i8* %9), !dbg !163
  %10 = load i8*, i8** %data.addr, align 8, !dbg !164
  call void @free(i8* %10) #7, !dbg !165
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44_bad", scope: !15, file: !15, line: 40, type: !16, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 42, type: !4)
!19 = !DILocation(line: 42, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 44, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 44, column: 12, scope: !14)
!25 = !DILocation(line: 45, column: 20, scope: !14)
!26 = !DILocation(line: 45, column: 10, scope: !14)
!27 = !DILocation(line: 46, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 9)
!29 = !DILocation(line: 46, column: 14, scope: !28)
!30 = !DILocation(line: 46, column: 9, scope: !14)
!31 = !DILocation(line: 46, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 46, column: 23)
!33 = !DILocation(line: 48, column: 12, scope: !14)
!34 = !DILocation(line: 48, column: 5, scope: !14)
!35 = !DILocation(line: 49, column: 5, scope: !14)
!36 = !DILocation(line: 49, column: 17, scope: !14)
!37 = !DILocation(line: 51, column: 5, scope: !14)
!38 = !DILocation(line: 51, column: 13, scope: !14)
!39 = !DILocation(line: 52, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 23, type: !4)
!42 = !DILocation(line: 23, column: 28, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 26, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 25, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 26, column: 14, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 27, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 27, column: 16, scope: !44)
!54 = !DILocalVariable(name: "dataLen", scope: !44, file: !15, line: 27, type: !50)
!55 = !DILocation(line: 27, column: 19, scope: !44)
!56 = !DILocation(line: 28, column: 26, scope: !44)
!57 = !DILocation(line: 28, column: 19, scope: !44)
!58 = !DILocation(line: 28, column: 17, scope: !44)
!59 = !DILocation(line: 30, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !15, line: 30, column: 9)
!61 = !DILocation(line: 30, column: 14, scope: !60)
!62 = !DILocation(line: 30, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 30, column: 9)
!64 = !DILocation(line: 30, column: 25, scope: !63)
!65 = !DILocation(line: 30, column: 23, scope: !63)
!66 = !DILocation(line: 30, column: 9, scope: !60)
!67 = !DILocation(line: 32, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !15, line: 31, column: 9)
!69 = !DILocation(line: 32, column: 28, scope: !68)
!70 = !DILocation(line: 32, column: 18, scope: !68)
!71 = !DILocation(line: 32, column: 13, scope: !68)
!72 = !DILocation(line: 32, column: 21, scope: !68)
!73 = !DILocation(line: 33, column: 9, scope: !68)
!74 = !DILocation(line: 30, column: 35, scope: !63)
!75 = !DILocation(line: 30, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 33, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 34, column: 9, scope: !44)
!80 = !DILocation(line: 34, column: 20, scope: !44)
!81 = !DILocation(line: 35, column: 19, scope: !44)
!82 = !DILocation(line: 35, column: 9, scope: !44)
!83 = !DILocation(line: 36, column: 14, scope: !44)
!84 = !DILocation(line: 36, column: 9, scope: !44)
!85 = !DILocation(line: 38, column: 1, scope: !40)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_44_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 90, column: 5, scope: !86)
!88 = !DILocation(line: 91, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 102, type: !90, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 102, type: !92)
!95 = !DILocation(line: 102, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 102, type: !93)
!97 = !DILocation(line: 102, column: 27, scope: !89)
!98 = !DILocation(line: 105, column: 22, scope: !89)
!99 = !DILocation(line: 105, column: 12, scope: !89)
!100 = !DILocation(line: 105, column: 5, scope: !89)
!101 = !DILocation(line: 107, column: 5, scope: !89)
!102 = !DILocation(line: 108, column: 5, scope: !89)
!103 = !DILocation(line: 109, column: 5, scope: !89)
!104 = !DILocation(line: 112, column: 5, scope: !89)
!105 = !DILocation(line: 113, column: 5, scope: !89)
!106 = !DILocation(line: 114, column: 5, scope: !89)
!107 = !DILocation(line: 116, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 78, type: !4)
!110 = !DILocation(line: 78, column: 12, scope: !108)
!111 = !DILocalVariable(name: "funcPtr", scope: !108, file: !15, line: 79, type: !21)
!112 = !DILocation(line: 79, column: 12, scope: !108)
!113 = !DILocation(line: 80, column: 20, scope: !108)
!114 = !DILocation(line: 80, column: 10, scope: !108)
!115 = !DILocation(line: 81, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !15, line: 81, column: 9)
!117 = !DILocation(line: 81, column: 14, scope: !116)
!118 = !DILocation(line: 81, column: 9, scope: !108)
!119 = !DILocation(line: 81, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 81, column: 23)
!121 = !DILocation(line: 83, column: 12, scope: !108)
!122 = !DILocation(line: 83, column: 5, scope: !108)
!123 = !DILocation(line: 84, column: 5, scope: !108)
!124 = !DILocation(line: 84, column: 16, scope: !108)
!125 = !DILocation(line: 85, column: 5, scope: !108)
!126 = !DILocation(line: 85, column: 13, scope: !108)
!127 = !DILocation(line: 86, column: 1, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 59, type: !22, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", arg: 1, scope: !128, file: !15, line: 59, type: !4)
!130 = !DILocation(line: 59, column: 32, scope: !128)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !15, line: 62, type: !45)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 61, column: 5)
!133 = !DILocation(line: 62, column: 14, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !132, file: !15, line: 63, type: !50)
!135 = !DILocation(line: 63, column: 16, scope: !132)
!136 = !DILocalVariable(name: "dataLen", scope: !132, file: !15, line: 63, type: !50)
!137 = !DILocation(line: 63, column: 19, scope: !132)
!138 = !DILocation(line: 64, column: 26, scope: !132)
!139 = !DILocation(line: 64, column: 19, scope: !132)
!140 = !DILocation(line: 64, column: 17, scope: !132)
!141 = !DILocation(line: 66, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !15, line: 66, column: 9)
!143 = !DILocation(line: 66, column: 14, scope: !142)
!144 = !DILocation(line: 66, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !15, line: 66, column: 9)
!146 = !DILocation(line: 66, column: 25, scope: !145)
!147 = !DILocation(line: 66, column: 23, scope: !145)
!148 = !DILocation(line: 66, column: 9, scope: !142)
!149 = !DILocation(line: 68, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !15, line: 67, column: 9)
!151 = !DILocation(line: 68, column: 28, scope: !150)
!152 = !DILocation(line: 68, column: 18, scope: !150)
!153 = !DILocation(line: 68, column: 13, scope: !150)
!154 = !DILocation(line: 68, column: 21, scope: !150)
!155 = !DILocation(line: 69, column: 9, scope: !150)
!156 = !DILocation(line: 66, column: 35, scope: !145)
!157 = !DILocation(line: 66, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !78}
!159 = !DILocation(line: 69, column: 9, scope: !142)
!160 = !DILocation(line: 70, column: 9, scope: !132)
!161 = !DILocation(line: 70, column: 20, scope: !132)
!162 = !DILocation(line: 71, column: 19, scope: !132)
!163 = !DILocation(line: 71, column: 9, scope: !132)
!164 = !DILocation(line: 72, column: 14, scope: !132)
!165 = !DILocation(line: 72, column: 9, scope: !132)
!166 = !DILocation(line: 74, column: 1, scope: !128)
