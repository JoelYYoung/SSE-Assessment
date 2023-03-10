; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !28
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !29
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !30
  %add = add i64 %call, 1, !dbg !31
  %call2 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  call void @printLine(i8* %4), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_goodG2BSink(i8** %dataArray) #0 !dbg !36 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !41
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !41
  store i8* %1, i8** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !48
  %add = add i64 %call, 1, !dbg !49
  %call2 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %4), !dbg !52
  ret void, !dbg !53
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!17 = !DILocation(line: 28, column: 86, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 31, type: !14)
!19 = !DILocation(line: 31, column: 12, scope: !9)
!20 = !DILocation(line: 31, column: 19, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 33, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 33, column: 14, scope: !22)
!27 = !DILocation(line: 36, column: 17, scope: !22)
!28 = !DILocation(line: 36, column: 23, scope: !22)
!29 = !DILocation(line: 36, column: 38, scope: !22)
!30 = !DILocation(line: 36, column: 31, scope: !22)
!31 = !DILocation(line: 36, column: 46, scope: !22)
!32 = !DILocation(line: 36, column: 9, scope: !22)
!33 = !DILocation(line: 37, column: 19, scope: !22)
!34 = !DILocation(line: 37, column: 9, scope: !22)
!35 = !DILocation(line: 39, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_66b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "dataArray", arg: 1, scope: !36, file: !10, line: 46, type: !13)
!38 = !DILocation(line: 46, column: 90, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !10, line: 48, type: !14)
!40 = !DILocation(line: 48, column: 12, scope: !36)
!41 = !DILocation(line: 48, column: 19, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !10, line: 50, type: !23)
!43 = distinct !DILexicalBlock(scope: !36, file: !10, line: 49, column: 5)
!44 = !DILocation(line: 50, column: 14, scope: !43)
!45 = !DILocation(line: 53, column: 17, scope: !43)
!46 = !DILocation(line: 53, column: 23, scope: !43)
!47 = !DILocation(line: 53, column: 38, scope: !43)
!48 = !DILocation(line: 53, column: 31, scope: !43)
!49 = !DILocation(line: 53, column: 46, scope: !43)
!50 = !DILocation(line: 53, column: 9, scope: !43)
!51 = !DILocation(line: 54, column: 19, scope: !43)
!52 = !DILocation(line: 54, column: 9, scope: !43)
!53 = !DILocation(line: 56, column: 1, scope: !36)
