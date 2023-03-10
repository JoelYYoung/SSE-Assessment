; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* %data, align 4, !dbg !19
  %call = call i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61b_badSource(i32 %0), !dbg !20
  store i32 %call, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !25, metadata !DIExpression()), !dbg !29
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !29
  %2 = load i32, i32* %data, align 4, !dbg !30
  %cmp = icmp sge i32 %2, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !34
  %idxprom = sext i32 %3 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !36
  store i32 1, i32* %arrayidx, align 4, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !41
  %cmp1 = icmp slt i32 %4, 10, !dbg !43
  br i1 %cmp1, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %5 to i64, !dbg !47
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !47
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !47
  call void @printIntLine(i32 %6), !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %7, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61b_badSource(i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  call void @goodB2G(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 -1, i32* %data, align 4, !dbg !86
  %0 = load i32, i32* %data, align 4, !dbg !87
  %call = call i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61b_goodG2BSource(i32 %0), !dbg !88
  store i32 %call, i32* %data, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata i32* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !94
  %2 = load i32, i32* %data, align 4, !dbg !95
  %cmp = icmp sge i32 %2, 0, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !99
  %idxprom = sext i32 %3 to i64, !dbg !101
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !101
  store i32 1, i32* %arrayidx, align 4, !dbg !102
  store i32 0, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !106
  %cmp1 = icmp slt i32 %4, 10, !dbg !108
  br i1 %cmp1, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !110
  %idxprom2 = sext i32 %5 to i64, !dbg !112
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !112
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !112
  call void @printIntLine(i32 %6), !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !115
  %inc = add nsw i32 %7, 1, !dbg !115
  store i32 %inc, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !122
}

declare dso_local i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61b_goodG2BSource(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  %0 = load i32, i32* %data, align 4, !dbg !127
  %call = call i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61b_goodB2GSource(i32 %0), !dbg !128
  store i32 %call, i32* %data, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata i32* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !133, metadata !DIExpression()), !dbg !134
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !134
  %2 = load i32, i32* %data, align 4, !dbg !135
  %cmp = icmp sge i32 %2, 0, !dbg !137
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !138

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !139
  %cmp1 = icmp slt i32 %3, 10, !dbg !140
  br i1 %cmp1, label %if.then, label %if.else, !dbg !141

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %4 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  store i32 1, i32* %arrayidx, align 4, !dbg !145
  store i32 0, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !149
  %cmp2 = icmp slt i32 %5, 10, !dbg !151
  br i1 %cmp2, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !153
  %idxprom3 = sext i32 %6 to i64, !dbg !155
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !155
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !155
  call void @printIntLine(i32 %7), !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !158
  %inc = add nsw i32 %8, 1, !dbg !158
  store i32 %inc, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !162

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !163
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !165
}

declare dso_local i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61b_goodB2GSource(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61_bad", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 49, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 49, column: 9, scope: !11)
!18 = !DILocation(line: 51, column: 10, scope: !11)
!19 = !DILocation(line: 52, column: 84, scope: !11)
!20 = !DILocation(line: 52, column: 12, scope: !11)
!21 = !DILocation(line: 52, column: 10, scope: !11)
!22 = !DILocalVariable(name: "i", scope: !23, file: !12, line: 54, type: !16)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 53, column: 5)
!24 = !DILocation(line: 54, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 55, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 55, column: 13, scope: !23)
!30 = !DILocation(line: 58, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 58, column: 13)
!32 = !DILocation(line: 58, column: 18, scope: !31)
!33 = !DILocation(line: 58, column: 13, scope: !23)
!34 = !DILocation(line: 60, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 59, column: 9)
!36 = !DILocation(line: 60, column: 13, scope: !35)
!37 = !DILocation(line: 60, column: 26, scope: !35)
!38 = !DILocation(line: 62, column: 19, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 62, column: 13)
!40 = !DILocation(line: 62, column: 17, scope: !39)
!41 = !DILocation(line: 62, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 62, column: 13)
!43 = !DILocation(line: 62, column: 26, scope: !42)
!44 = !DILocation(line: 62, column: 13, scope: !39)
!45 = !DILocation(line: 64, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 63, column: 13)
!47 = !DILocation(line: 64, column: 30, scope: !46)
!48 = !DILocation(line: 64, column: 17, scope: !46)
!49 = !DILocation(line: 65, column: 13, scope: !46)
!50 = !DILocation(line: 62, column: 33, scope: !42)
!51 = !DILocation(line: 62, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 65, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 66, column: 9, scope: !35)
!56 = !DILocation(line: 69, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !31, file: !12, line: 68, column: 9)
!58 = !DILocation(line: 72, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_61_good", scope: !12, file: !12, line: 137, type: !13, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 139, column: 5, scope: !59)
!61 = !DILocation(line: 140, column: 5, scope: !59)
!62 = !DILocation(line: 141, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 152, type: !64, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!16, !16, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 152, type: !16)
!70 = !DILocation(line: 152, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 152, type: !66)
!72 = !DILocation(line: 152, column: 27, scope: !63)
!73 = !DILocation(line: 155, column: 22, scope: !63)
!74 = !DILocation(line: 155, column: 12, scope: !63)
!75 = !DILocation(line: 155, column: 5, scope: !63)
!76 = !DILocation(line: 157, column: 5, scope: !63)
!77 = !DILocation(line: 158, column: 5, scope: !63)
!78 = !DILocation(line: 159, column: 5, scope: !63)
!79 = !DILocation(line: 162, column: 5, scope: !63)
!80 = !DILocation(line: 163, column: 5, scope: !63)
!81 = !DILocation(line: 164, column: 5, scope: !63)
!82 = !DILocation(line: 166, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 83, type: !16)
!85 = !DILocation(line: 83, column: 9, scope: !83)
!86 = !DILocation(line: 85, column: 10, scope: !83)
!87 = !DILocation(line: 86, column: 88, scope: !83)
!88 = !DILocation(line: 86, column: 12, scope: !83)
!89 = !DILocation(line: 86, column: 10, scope: !83)
!90 = !DILocalVariable(name: "i", scope: !91, file: !12, line: 88, type: !16)
!91 = distinct !DILexicalBlock(scope: !83, file: !12, line: 87, column: 5)
!92 = !DILocation(line: 88, column: 13, scope: !91)
!93 = !DILocalVariable(name: "buffer", scope: !91, file: !12, line: 89, type: !26)
!94 = !DILocation(line: 89, column: 13, scope: !91)
!95 = !DILocation(line: 92, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !12, line: 92, column: 13)
!97 = !DILocation(line: 92, column: 18, scope: !96)
!98 = !DILocation(line: 92, column: 13, scope: !91)
!99 = !DILocation(line: 94, column: 20, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 93, column: 9)
!101 = !DILocation(line: 94, column: 13, scope: !100)
!102 = !DILocation(line: 94, column: 26, scope: !100)
!103 = !DILocation(line: 96, column: 19, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !12, line: 96, column: 13)
!105 = !DILocation(line: 96, column: 17, scope: !104)
!106 = !DILocation(line: 96, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 96, column: 13)
!108 = !DILocation(line: 96, column: 26, scope: !107)
!109 = !DILocation(line: 96, column: 13, scope: !104)
!110 = !DILocation(line: 98, column: 37, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 97, column: 13)
!112 = !DILocation(line: 98, column: 30, scope: !111)
!113 = !DILocation(line: 98, column: 17, scope: !111)
!114 = !DILocation(line: 99, column: 13, scope: !111)
!115 = !DILocation(line: 96, column: 33, scope: !107)
!116 = !DILocation(line: 96, column: 13, scope: !107)
!117 = distinct !{!117, !109, !118, !54}
!118 = !DILocation(line: 99, column: 13, scope: !104)
!119 = !DILocation(line: 100, column: 9, scope: !100)
!120 = !DILocation(line: 103, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !96, file: !12, line: 102, column: 9)
!122 = !DILocation(line: 106, column: 1, scope: !83)
!123 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 113, type: !16)
!125 = !DILocation(line: 113, column: 9, scope: !123)
!126 = !DILocation(line: 115, column: 10, scope: !123)
!127 = !DILocation(line: 116, column: 88, scope: !123)
!128 = !DILocation(line: 116, column: 12, scope: !123)
!129 = !DILocation(line: 116, column: 10, scope: !123)
!130 = !DILocalVariable(name: "i", scope: !131, file: !12, line: 118, type: !16)
!131 = distinct !DILexicalBlock(scope: !123, file: !12, line: 117, column: 5)
!132 = !DILocation(line: 118, column: 13, scope: !131)
!133 = !DILocalVariable(name: "buffer", scope: !131, file: !12, line: 119, type: !26)
!134 = !DILocation(line: 119, column: 13, scope: !131)
!135 = !DILocation(line: 121, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !12, line: 121, column: 13)
!137 = !DILocation(line: 121, column: 18, scope: !136)
!138 = !DILocation(line: 121, column: 23, scope: !136)
!139 = !DILocation(line: 121, column: 26, scope: !136)
!140 = !DILocation(line: 121, column: 31, scope: !136)
!141 = !DILocation(line: 121, column: 13, scope: !131)
!142 = !DILocation(line: 123, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !12, line: 122, column: 9)
!144 = !DILocation(line: 123, column: 13, scope: !143)
!145 = !DILocation(line: 123, column: 26, scope: !143)
!146 = !DILocation(line: 125, column: 19, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !12, line: 125, column: 13)
!148 = !DILocation(line: 125, column: 17, scope: !147)
!149 = !DILocation(line: 125, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 125, column: 13)
!151 = !DILocation(line: 125, column: 26, scope: !150)
!152 = !DILocation(line: 125, column: 13, scope: !147)
!153 = !DILocation(line: 127, column: 37, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 126, column: 13)
!155 = !DILocation(line: 127, column: 30, scope: !154)
!156 = !DILocation(line: 127, column: 17, scope: !154)
!157 = !DILocation(line: 128, column: 13, scope: !154)
!158 = !DILocation(line: 125, column: 33, scope: !150)
!159 = !DILocation(line: 125, column: 13, scope: !150)
!160 = distinct !{!160, !152, !161, !54}
!161 = !DILocation(line: 128, column: 13, scope: !147)
!162 = !DILocation(line: 129, column: 9, scope: !143)
!163 = !DILocation(line: 132, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !136, file: !12, line: 131, column: 9)
!165 = !DILocation(line: 135, column: 1, scope: !123)
