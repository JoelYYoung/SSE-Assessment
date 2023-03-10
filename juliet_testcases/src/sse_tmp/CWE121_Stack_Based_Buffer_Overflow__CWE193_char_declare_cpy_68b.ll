; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68_badData = external dso_local global i8*, align 8
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68_goodG2BData = external dso_local global i8*, align 8
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !25
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay) #5, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  call void @printLine(i8* %3), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_goodG2BSink() #0 !dbg !30 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68_goodG2BData, align 8, !dbg !33
  store i8* %0, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay) #5, !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %3), !dbg !41
  ret void, !dbg !42
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 35, column: 12, scope: !9)
!17 = !DILocation(line: 35, column: 19, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 37, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 11)
!23 = !DILocation(line: 37, column: 14, scope: !19)
!24 = !DILocation(line: 39, column: 16, scope: !19)
!25 = !DILocation(line: 39, column: 22, scope: !19)
!26 = !DILocation(line: 39, column: 9, scope: !19)
!27 = !DILocation(line: 40, column: 19, scope: !19)
!28 = !DILocation(line: 40, column: 9, scope: !19)
!29 = !DILocation(line: 42, column: 1, scope: !9)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_68b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "data", scope: !30, file: !10, line: 51, type: !14)
!32 = !DILocation(line: 51, column: 12, scope: !30)
!33 = !DILocation(line: 51, column: 19, scope: !30)
!34 = !DILocalVariable(name: "source", scope: !35, file: !10, line: 53, type: !20)
!35 = distinct !DILexicalBlock(scope: !30, file: !10, line: 52, column: 5)
!36 = !DILocation(line: 53, column: 14, scope: !35)
!37 = !DILocation(line: 55, column: 16, scope: !35)
!38 = !DILocation(line: 55, column: 22, scope: !35)
!39 = !DILocation(line: 55, column: 9, scope: !35)
!40 = !DILocation(line: 56, column: 19, scope: !35)
!41 = !DILocation(line: 56, column: 9, scope: !35)
!42 = !DILocation(line: 58, column: 1, scope: !30)
