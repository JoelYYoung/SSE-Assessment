; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_61b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_fgets_61b_badSource(i32 %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !18, metadata !DIExpression()), !dbg !24
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !25
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !27
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !28
  %cmp = icmp ne i8* %call, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %call2 = call i32 @atoi(i8* %arraydecay1) #5, !dbg !33
  store i32 %call2, i32* %data.addr, align 4, !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !38
  ret i32 %2, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_fgets_61b_goodG2BSource(i32 %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 7, i32* %data.addr, align 4, !dbg !43
  %0 = load i32, i32* %data.addr, align 4, !dbg !44
  ret i32 %0, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_fgets_61b_goodB2GSource(i32 %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !49, metadata !DIExpression()), !dbg !51
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !52
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !54
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !55
  %cmp = icmp ne i8* %call, null, !dbg !56
  br i1 %cmp, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !58
  %call2 = call i32 @atoi(i8* %arraydecay1) #5, !dbg !60
  store i32 %call2, i32* %data.addr, align 4, !dbg !61
  br label %if.end, !dbg !62

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !65
  ret i32 %2, !dbg !66
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_61b_badSource", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_61b.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 24, type: !15)
!17 = !DILocation(line: 24, column: 61, scope: !11)
!18 = !DILocalVariable(name: "inputBuffer", scope: !19, file: !12, line: 27, type: !20)
!19 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 112, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 14)
!24 = !DILocation(line: 27, column: 14, scope: !19)
!25 = !DILocation(line: 29, column: 19, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !12, line: 29, column: 13)
!27 = !DILocation(line: 29, column: 49, scope: !26)
!28 = !DILocation(line: 29, column: 13, scope: !26)
!29 = !DILocation(line: 29, column: 56, scope: !26)
!30 = !DILocation(line: 29, column: 13, scope: !19)
!31 = !DILocation(line: 32, column: 25, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !12, line: 30, column: 9)
!33 = !DILocation(line: 32, column: 20, scope: !32)
!34 = !DILocation(line: 32, column: 18, scope: !32)
!35 = !DILocation(line: 33, column: 9, scope: !32)
!36 = !DILocation(line: 36, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !26, file: !12, line: 35, column: 9)
!38 = !DILocation(line: 39, column: 12, scope: !11)
!39 = !DILocation(line: 39, column: 5, scope: !11)
!40 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_61b_goodG2BSource", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !12, line: 47, type: !15)
!42 = !DILocation(line: 47, column: 65, scope: !40)
!43 = !DILocation(line: 51, column: 10, scope: !40)
!44 = !DILocation(line: 52, column: 12, scope: !40)
!45 = !DILocation(line: 52, column: 5, scope: !40)
!46 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_61b_goodB2GSource", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !12, line: 56, type: !15)
!48 = !DILocation(line: 56, column: 65, scope: !46)
!49 = !DILocalVariable(name: "inputBuffer", scope: !50, file: !12, line: 59, type: !20)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 58, column: 5)
!51 = !DILocation(line: 59, column: 14, scope: !50)
!52 = !DILocation(line: 61, column: 19, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 61, column: 13)
!54 = !DILocation(line: 61, column: 49, scope: !53)
!55 = !DILocation(line: 61, column: 13, scope: !53)
!56 = !DILocation(line: 61, column: 56, scope: !53)
!57 = !DILocation(line: 61, column: 13, scope: !50)
!58 = !DILocation(line: 64, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 62, column: 9)
!60 = !DILocation(line: 64, column: 20, scope: !59)
!61 = !DILocation(line: 64, column: 18, scope: !59)
!62 = !DILocation(line: 65, column: 9, scope: !59)
!63 = !DILocation(line: 68, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !53, file: !12, line: 67, column: 9)
!65 = !DILocation(line: 71, column: 12, scope: !46)
!66 = !DILocation(line: 71, column: 5, scope: !46)
